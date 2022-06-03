import 'package:meta/meta.dart';
import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    required this.message,
    required this.accessToken,
    required this.tokenType,
  });

  final String message;
  final String accessToken;
  final String tokenType;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        message: json["message"] == null ? null : json["message"],
        accessToken: json["access_token"] == null ? "" : json["access_token"],
        tokenType: json["token_type"] == null ? "" : json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
      };
}
