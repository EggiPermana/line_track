// To parse this JSON data, do
//
//     final responseRegister = responseRegisterFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResponseRegister responseRegisterFromJson(String str) => ResponseRegister.fromJson(json.decode(str));

String responseRegisterToJson(ResponseRegister data) => json.encode(data.toJson());

class ResponseRegister {
  ResponseRegister({
    required this.message,
    required this.data,
    required this.accessToken,
    required this.tokenType,
  });

  final String message;
  final Data? data;
  final String accessToken;
  final String tokenType;

  factory ResponseRegister.fromJson(Map<String, dynamic> json) => ResponseRegister(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    accessToken: json["access_token"] == null ? "" : json["access_token"],
    tokenType: json["token_type"] == null ? "" : json["token_type"], message: '',
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data?.toJson(),
    "access_token": accessToken == null ? null : accessToken,
    "token_type": tokenType == null ? null : tokenType,
  };
}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String name;
  final String email;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "id": id == null ? null : id,
  };
}
