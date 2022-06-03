import 'package:flutter/material.dart';
import 'package:line_track/core/repository/repository.dart';
import 'package:line_track/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameControll = TextEditingController();
  TextEditingController emailControll = TextEditingController();
  TextEditingController passwordControll = TextEditingController();
  final Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea
        (child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 140,0 , 0),
              height: 50,
              child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: TextFormField(
                controller: nameControll,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                controller: emailControll,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                controller: passwordControll,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  registerSubmit(context);
                },
                child: Text("Register"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  primary: const Color(0xFF0BAA97),
                  onPrimary: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
  Future<void> registerSubmit(BuildContext ctx) async {
    String name = nameControll.value.text;
    String email = emailControll.value.text;
    String password = passwordControll.value.text;
    var response = await repository.registerRepo(name, email, password);

    if (response.accessToken.isNotEmpty) {
      try{
        await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LoginScreen()));
      } catch (e) {
        print(response.message);
      }
    } else {
      showErrorDialog('Error', response.message);
    }
  }

  Future<void> showErrorDialog(String tittle, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tittle),
        content: Text(message),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

}


