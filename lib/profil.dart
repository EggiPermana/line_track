import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar (
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: Icon(Icons.arrow_back_ios),
        title: Text ("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(

        ),
      ),
    );
  }
}
