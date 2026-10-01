import Cocoa
import FlutterMacOS
import ServiceManagement

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
    registerLaunchAtStartupChannel(messenger: flutterViewController.engine.binaryMessenger)

    super.awakeFromNib()
  }

  // The launch_at_startup plugin ships no macOS code and expects the app to answer this channel.
  private func registerLaunchAtStartupChannel(messenger: FlutterBinaryMessenger) {
    FlutterMethodChannel(name: "launch_at_startup", binaryMessenger: messenger)
      .setMethodCallHandler { call, result in
        switch call.method {
        case "launchAtStartupIsEnabled":
          if #available(macOS 13.0, *) {
            result(SMAppService.mainApp.status == .enabled)
          } else {
            result(false)
          }
        case "launchAtStartupSetEnabled":
          guard #available(macOS 13.0, *) else {
            result(FlutterError(code: "unsupported", message: "Launch at login requires macOS 13", details: nil))
            return
          }
          guard let arguments = call.arguments as? [String: Any],
                let enabled = arguments["setEnabledValue"] as? Bool else {
            result(FlutterError(code: "bad_arguments", message: nil, details: nil))
            return
          }
          do {
            if enabled {
              try SMAppService.mainApp.register()
            } else {
              try SMAppService.mainApp.unregister()
            }
            result(nil)
          } catch {
            result(FlutterError(code: "service_management", message: error.localizedDescription, details: nil))
          }
        default:
          result(FlutterMethodNotImplemented)
        }
      }
  }
}
