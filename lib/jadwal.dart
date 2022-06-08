import 'package:flutter/material.dart';
import 'package:line_track/core/respon/response_jadwal.dart';

class JadwalScreen extends StatelessWidget {
  final Jadwal jadwal;
  const JadwalScreen({Key? key, required this.jadwal}) : super(key: key);

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
                    child: Text('${jadwal.from} - ${jadwal.to}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text('${jadwal.day} - ${jadwal.startTime} - ${jadwal.endTime}'),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

