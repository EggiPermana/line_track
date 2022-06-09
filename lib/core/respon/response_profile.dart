// To parse this JSON data, do
//
//     final responseDataprofile = responseDataprofileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResponseDataprofile responseDataprofileFromJson(String str) => ResponseDataprofile.fromJson(json.decode(str));

String responseDataprofileToJson(ResponseDataprofile data) => json.encode(data.toJson());

class ResponseDataprofile {
  ResponseDataprofile({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.sim,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final dynamic sim;
  final dynamic photo;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ResponseDataprofile.fromJson(Map<String, dynamic> json) => ResponseDataprofile(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    emailVerifiedAt: json["email_verified_at"],
    sim: json["sim"],
    photo: json["photo"],
    createdAt:  DateTime.parse(json["created_at"]),
    updatedAt:  DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "email_verified_at": emailVerifiedAt,
    "sim": sim,
    "photo": photo,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
