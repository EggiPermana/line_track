// To parse this JSON data, do
//
//     final responseJadwal = responseJadwalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResponseJadwal responseJadwalFromJson(String str) => ResponseJadwal.fromJson(json.decode(str));

String responseJadwalToJson(ResponseJadwal data) => json.encode(data.toJson());

class ResponseJadwal {
  ResponseJadwal({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final List<Jadwal> data;

  factory ResponseJadwal.fromJson(Map<String, dynamic> json) => ResponseJadwal(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? [] : List<Jadwal>.from(json["data"].map((x) => Jadwal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Jadwal {
  Jadwal({
    required this.id,
    required this.transportId,
    required this.from,
    required this.to,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String transportId;
  final String from;
  final String to;
  final String startTime;
  final String endTime;
  final String day;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
    id: json["id"] == null ? null : json["id"],
    transportId: json["transport_id"] == null ? null : json["transport_id"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
    startTime: json["start_time"] == null ? null : json["start_time"],
    endTime: json["end_time"] == null ? null : json["end_time"],
    day: json["day"] == null ? null : json["day"],
    createdAt: json["created_at"] == null ? DateTime.now() : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? DateTime.now() : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "transport_id": transportId == null ? null : transportId,
    "from": from == null ? null : from,
    "to": to == null ? null : to,
    "start_time": startTime == null ? null : startTime,
    "end_time": endTime == null ? null : endTime,
    "day": day == null ? null : day,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
