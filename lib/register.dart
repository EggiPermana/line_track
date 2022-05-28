import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                onPressed: () {},
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
}
