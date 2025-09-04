class AuthorizedApp {
  final String pubkey;
  final String name;
  final List<String> relays;
  final List<String> permissions;

  AuthorizedApp({
    required this.pubkey,
    required this.name,
    required this.relays,
    required this.permissions,
  });

  factory AuthorizedApp.fromJson(Map<String, dynamic> json) {
    return AuthorizedApp(
      pubkey: json['pubkey'] as String,
      name: json['name'] as String,
      relays: (json['relays'] as List<dynamic>).cast<String>(),
      permissions: (json['permissions'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pubkey': pubkey,
      'name': name,
      'relays': relays,
      'permissions': permissions,
    };
  }
}
