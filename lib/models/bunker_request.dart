import 'package:nostr_bunker/nostr_bunker.dart';

enum BunkerRequestStatus { pending, blocked, processed }

class BunkerRequest {
  Nip46Request originalRequest;
  DateTime date;
  BunkerRequestStatus status;

  BunkerRequest({
    required this.originalRequest,
    DateTime? date,
    this.status = BunkerRequestStatus.pending,
  }) : date = date ?? DateTime.now();

  factory BunkerRequest.fromJson(Map<String, dynamic> json) {
    return BunkerRequest(
      originalRequest: Nip46Request.fromJson(json['originalRequest']),
      date: DateTime.parse(json['date']),
      status: BunkerRequestStatus.values.byName(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originalRequest': originalRequest.toJson(),
      'date': date.toIso8601String(),
      'status': status.name,
    };
  }
}
