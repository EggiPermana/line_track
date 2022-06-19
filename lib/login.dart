import 'package:flutter/material.dart';
import 'package:line_track/core/repository/repository.dart';
import 'package:line_track/home_screen.dart';
import 'package:line_track/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControll = TextEditingController();
  TextEditingController passwordControll = TextEditingController();
  final Repository repository = Repository();
  String email = '', password = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailControll = TextEditingController();
    passwordControll = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 140, 0, 0),
                  height: 50,
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Please use your registered account")),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: TextFormField(
                    controller: emailControll,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextFormField(
                    controller: passwordControll,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      loginSubmit(email, password, context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => HomeScreen()));
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      primary: const Color(0xFF0BAA97),
                      onPrimary: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you any accounts ?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Register();
                            }));
                          },
                          child: Text("Register")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginSubmit(String email, password, BuildContext ctx) async {
    String email = emailControll.value.text;
    String password = passwordControll.value.text;
    var response = await repository.logInRepo(email, password);

    repository.writeSecureTokenData("token", 'Bearer ${response.content.accessToken}');
    repository.writeSecureTokenData("email", email);

    if (response.content.accessToken.isNotEmpty) {
      try {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } catch (e) {
        print(response.message);
      }
    } else {
      showErrorDialog('Error', response.message);
    }
  }

  Future<void> showErrorDialog(String title, String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
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
