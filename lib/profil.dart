import 'package:flutter/material.dart';
import 'package:line_track/core/repository/repository.dart';
import 'package:line_track/login.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late Repository _repository;
  String email = "" ;

  @override
  void initState() {
    super.initState();
    _repository = Repository();
    getEmail();
  }

  void getEmail() async {
    email = await _repository.readSecureData('email') ?? "";
    print("EMAILNYA EGGE ADAlah $email");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: SizedBox(
                        height: 95, width: 95,
                        child: CircleAvatar
                          (
                          child: Icon(Icons.person, size: 50,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 30),
                    child: Text(
                      email,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _repository.writeSecureTokenData('token' , '');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
                      },
                      child: Text("Logout"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 50),
                        primary: const Color(0xFFDC143C),
                        onPrimary: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
