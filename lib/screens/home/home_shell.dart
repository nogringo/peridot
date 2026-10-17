import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peridot/l10n/app_localizations.dart';
import 'package:peridot/routes/app_routes.dart';
import 'package:peridot/screens/home/home_controller.dart';
import 'package:peridot/screens/home/widgets/requests_icon_view.dart';

enum HomeTab { applications, requests, logs }

bool isWideLayout(BuildContext context) =>
    MediaQuery.sizeOf(context).width > 600;

const homeTabMaxWidth = 800.0;

class HomeScope extends InheritedWidget {
  final HomeController controller;
  final StatefulNavigationShell navigationShell;
  final int lastTabIndex;

  const HomeScope({
    super.key,
    required this.controller,
    required this.navigationShell,
    required this.lastTabIndex,
    required super.child,
  });

  // Read at use time, so pages do not rebuild on every navigation.
  static HomeScope of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<HomeScope>()!;

  void showLastTab() => navigationShell.goBranch(lastTabIndex);

  @override
  bool updateShouldNotify(HomeScope oldWidget) => false;
}

class HomeShell extends StatefulWidget {
  final GoRouterState state;
  final StatefulNavigationShell navigationShell;

  const HomeShell({
    super.key,
    required this.state,
    required this.navigationShell,
  });

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  final controller = HomeController()..init();
  var lastTabIndex = 0;

  StatefulNavigationShell get navigationShell => widget.navigationShell;

  int? get selectedTabIndex =>
      navigationShell.currentIndex < HomeTab.values.length
      ? navigationShell.currentIndex
      : null;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void selectTab(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    lastTabIndex = selectedTabIndex ?? lastTabIndex;
    return HomeScope(
      controller: controller,
      navigationShell: navigationShell,
      lastTabIndex: lastTabIndex,
      child: isWideLayout(context)
          ? _buildLargeLayout(context)
          : _buildSmallLayout(context),
    );
  }

  Widget _buildSmallLayout(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isAtTabRoot = AppRoutes.tabs.contains(widget.state.uri.path);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: isAtTabRoot
          ? NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.apps),
                  label: l10n.applications,
                ),
                NavigationDestination(
                  icon: RequestsIconView(controller: controller),
                  label: l10n.requests,
                ),
                NavigationDestination(
                  icon: Icon(Icons.history),
                  label: l10n.logs,
                ),
              ],
              onDestinationSelected: selectTab,
            )
          : null,
    );
  }

  Widget _buildLargeLayout(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isExtraWide = constraints.maxWidth >= 1000;
          return Row(
            children: [
              NavigationRail(
                extended: isExtraWide,
                leading: Builder(
                  builder: (context) {
                    final icon = Icon(
                      Icons.album,
                      color: Theme.of(context).colorScheme.primary,
                      size: 32,
                    );

                    if (isExtraWide) {
                      return SizedBox(
                        width: 256,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 12),
                              icon,
                              SizedBox(width: 24),
                              Text(
                                l10n.appBrandName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return icon;
                  },
                ),
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.apps),
                    label: Text(l10n.applications),
                  ),
                  NavigationRailDestination(
                    icon: RequestsIconView(controller: controller),
                    label: Text(l10n.requests),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.history),
                    label: Text(l10n.logs),
                  ),
                ],
                trailing: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Builder(
                    builder: (context) {
                      if (isExtraWide) {
                        return SizedBox(
                          width: 256,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: OutlinedButton.icon(
                              onPressed: () => context.go(AppRoutes.settings),
                              label: Text(l10n.settings),
                              icon: Icon(Icons.settings),
                            ),
                          ),
                        );
                      }
                      return IconButton(
                        tooltip: l10n.settings,
                        onPressed: () => context.go(AppRoutes.settings),
                        icon: Icon(Icons.settings),
                      );
                    },
                  ),
                ),
                trailingAtBottom: true,
                selectedIndex: selectedTabIndex,
                onDestinationSelected: selectTab,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: navigationShell,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
