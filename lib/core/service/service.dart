// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:line_track/core/respon/reponse_login.dart';
import 'package:http/http.dart' as http;
import 'package:line_track/core/respon/response_jadwal.dart';
import 'package:line_track/core/respon/response_register.dart';
import 'package:line_track/value/value.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

    var jsss = jsonEncode(
        <String, String>{'email': email, 'password': password});
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
      body: jsonEncode(
          <String, String>{'name': name, 'email': email, 'password': password}),
    );

    var jsss = jsonEncode(
        <String, String>{'name': name, 'email': email, 'password': password});
    print('hasil $jsss');
    var responseRegister = json.decode(response.body);
    print('hasilue $responseRegister');

    return ResponseRegister.fromJson(responseRegister);
  }

  Future<ResponseJadwal> jadwalService() async {
    var header = {
      "Content-Type": "application/json",
      "Authorization": await readSecureData('token') ?? ""
    };

    var response = await http.get(
        Uri.parse('$BASE_URL/api/schedule'),
        headers: header);

    var res = json.decode(response.body);
    print(res);
    return ResponseJadwal.fromJson(res);
  }

  Future<String?> readSecureData(String key) {
    const storage = FlutterSecureStorage();
    var readData = storage.read(key: key);
    return readData;
  }

  Object writeSecureTokenData( String value) {
    final storage = const FlutterSecureStorage();
    var writeData = storage.write(key: 'token', value: value);
    return writeData;
  }



}
