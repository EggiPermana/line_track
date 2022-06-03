// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:line_track/core/respon/reponse_login.dart';
import 'package:http/http.dart' as http;
import 'package:line_track/core/respon/response_register.dart';
import 'package:line_track/value/value.dart';

class Service {
  Future<ResponseLogin> loginService(String email, password) async {

    var header = {
      "Content-Type": "application/json"
    };

    var response = await http.post(
      Uri.parse('$BASE_URL/api/login'),
      headers: header,
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    var jsss = jsonEncode(<String, String>{'email': email, 'password': password});
    print('hasil $jsss');
    var responseLogin = json.decode(response.body);
    print('hasilue $responseLogin');

    return ResponseLogin.fromJson(responseLogin);
  }

  Future<ResponseRegister> registerService(String name, email, password) async {

    var header = {
      "Content-Type": "application/json"
    };

    var response = await http.post(
      Uri.parse('$BASE_URL/api/register'),
      headers: header,
      body: jsonEncode(<String, String>{'name': name,  'email': email, 'password': password}),
    );

    var jsss = jsonEncode(<String, String>{'name': name, 'email': email, 'password': password});
    print('hasil $jsss');
    var responseRegister = json.decode(response.body);
    print('hasilue $responseRegister');

    return ResponseRegister.fromJson(responseRegister);
  }
}
