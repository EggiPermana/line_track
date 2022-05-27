import 'package:flutter/material.dart';
import 'package:line_track/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea
        (child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                margin : EdgeInsets.fromLTRB(20, 140, 0, 0),
                height: 50,
                child:  Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
      ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("Please use your registered account")),
                SizedBox(height: 50,),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nama",
                      border:  OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 150,),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text ("Login"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      primary: const Color(0xFF0BAA97),
                      onPrimary: const Color(0xFFFFFFFF),),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you any accounts ?"),
                      TextButton
                        (onPressed: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return Register() })) , child: Text ("Register")),
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
}