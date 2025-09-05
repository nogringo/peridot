class AuthorizedApp {
  final String appPubkey;
  final String signerPubkey;
  final String name;
  final List<String> relays;
  final List<String> permissions;

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
      permissions: (json['permissions'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appPubkey': appPubkey,
      'signerPubkey': signerPubkey,
      'name': name,
      'relays': relays,
      'permissions': permissions,
    };
  }
}
