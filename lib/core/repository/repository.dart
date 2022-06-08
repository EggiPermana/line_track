import 'package:line_track/core/respon/reponse_login.dart';
import 'package:line_track/core/respon/response_jadwal.dart';
import 'package:line_track/core/respon/response_register.dart';
import 'package:line_track/core/service/service.dart';

class Repository extends Service {
  final Service service = Service();

  Future<ResponseLogin> logInRepo(String email, password) async {
    return service.loginService(email, password);
  }

  Future<ResponseRegister> registerRepo(String name, email, password) async {
    return service.registerService(name, email, password);
  }

  Future<ResponseJadwal> jadwalRepo() async{
    return service.jadwalService();
  }


}
