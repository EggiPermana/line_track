// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    required this.status,
    required this.message,
    required this.error,
    required this.content,
  });

  final String status;
  final String message;
  final dynamic error;
  final Content content;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    error: json["error"],
    content: Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "error": error,
    "content": content == null ? null : content.toJson(),
  };
}

class Content {
  Content({
    required this.code,
    required this.accessToken,
    required this.tokenType,
  });

  final int code;
  final String accessToken;
  final String tokenType;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    code: json["code"] == null ? null : json["code"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    tokenType: json["token_type"] == null ? null : json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "access_token": accessToken == null ? null : accessToken,
    "token_type": tokenType == null ? null : tokenType,
  };
}
