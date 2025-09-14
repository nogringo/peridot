import 'package:peridot/models/permission.dart';

enum PermissionStatus { authorized, blocked, unknown }

class AuthorizedApp {
  String appPubkey;
  String signerPubkey;
  String name;
  List<String> relays;
  List<Permission> permissions;

  AuthorizedApp({
    required this.appPubkey,
    required this.signerPubkey,
    required this.name,
    required this.relays,
    required this.permissions,
  });

  factory AuthorizedApp.fromJson(Map<String, dynamic> json) {
    return AuthorizedApp(
      appPubkey: json['appPubkey'] as String,
      signerPubkey: json['signerPubkey'] as String,
      name: json['name'] as String,
      relays: (json['relays'] as List<dynamic>).cast<String>(),
      permissions: (json['permissions'] as List<dynamic>)
          .map(
            (p) => p is String
                ? Permission(name: p, isAllowed: !p.startsWith('-'))
                : Permission(
                    name: p['name'] as String,
                    isAllowed: p['isAllowed'] as bool? ?? true,
                  ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appPubkey': appPubkey,
      'signerPubkey': signerPubkey,
      'name': name,
      'relays': relays,
      'permissions': permissions
          .map((p) => {'name': p.name, 'isAllowed': p.isAllowed})
          .toList(),
    };
  }

  PermissionStatus getPermissionStatus(String permission) {
    // Check for exact permission match
    for (final perm in permissions) {
      if (perm.name == permission) {
        return perm.isAllowed
            ? PermissionStatus.authorized
            : PermissionStatus.blocked;
      }
    }

    // Check for wildcard permissions
    for (final perm in permissions) {
      if (perm.name == '*') {
        return perm.isAllowed
            ? PermissionStatus.authorized
            : PermissionStatus.blocked;
      }
    }

    // Check for parameterized permissions (e.g., "sign_event:4" for specific event kinds)
    for (final perm in permissions) {
      if (perm.name.startsWith('$permission:')) {
        return perm.isAllowed
            ? PermissionStatus.authorized
            : PermissionStatus.blocked;
      }
    }

    // Permission not explicitly set - requires user approval
    return PermissionStatus.unknown;
  }

  void authorizePermission(String permission) {
    // Remove any existing permission with the same name
    permissions.removeWhere((p) => p.name == permission);
    // Add the authorized permission
    permissions.add(Permission(name: permission, isAllowed: true));
  }

  void blockPermission(String permission) {
    // Remove any existing permission with the same name
    permissions.removeWhere((p) => p.name == permission);
    // Add the blocked permission
    permissions.add(Permission(name: permission, isAllowed: false));
  }
}
