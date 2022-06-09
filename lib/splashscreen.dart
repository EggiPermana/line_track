import 'package:flutter/material.dart';
import 'package:line_track/core/repository/repository.dart';
import 'package:line_track/home_screen.dart';
import 'package:line_track/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Repository repository;

  navigatetohome() async {
    String token = await repository.readSecureData('token') ?? "";
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      if (token.isEmpty) {
        return LoginScreen();
      } else {
        return HomeScreen();
      }
    }));
  }

  @override
  void initState() {
    super.initState();
    repository = Repository();
    navigatetohome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/ANGKOTTT.png",
              height: 120,
            ),
            Text("WELCOME TO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle:FontStyle.italic),),
            Text("JADWALINE APPS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle:FontStyle.italic),),
          ],
        )
      ),
    );

    Scaffold(
      body: Center(
        child: Text("Welcome to"),
      )
    );
  }
}
