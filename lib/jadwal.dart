import 'package:flutter/material.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({Key? key}) : super(key: key);

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
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
        title: Text("Jadwal"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.height * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text("Bondowoso - Maesan"),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text("Hari ini 08.00 - 10.00"),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
