import 'package:flutter/material.dart';
import 'package:line_track/jadwal_item.dart';
import 'package:line_track/profil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: HomeContent(),
            )
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profil()  ));
    },
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ),
         const SizedBox(height: 24,),
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 18,),
              Text("Welcome"),
              Text(
                "Nama Pengguna",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Text("Welcome"),
              SizedBox(height: 18,)
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 38, bottom: 12),
          child: Text(
            "Jadwal Kendaraan",
            style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (ctx, index) => JadwalItem()),
        )
      ],
    );
  }
}
