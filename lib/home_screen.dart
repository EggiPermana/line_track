import 'package:flutter/material.dart';
import 'package:line_track/core/repository/repository.dart';
import 'package:line_track/core/respon/response_jadwal.dart';
import 'package:line_track/jadwal_item.dart';
import 'package:line_track/profil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Repository _repository;
  ResponseJadwal? _jadwals = null;

  @override
  void initState() {
    super.initState();
    _repository = Repository();
    getJadwal();
  }

  void getJadwal() async {
    _jadwals = await _repository.jadwalService();

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                child: HomeContent(listJadwal: _jadwals?.data ?? []),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<Jadwal> listJadwal;

  const HomeContent({Key? key, required this.listJadwal}) : super(key: key);

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profil()));
            },
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 18,
              ),
              Text("Welcome"),
              Text(
                "Nama Pengguna",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Text("Welcome"),
              SizedBox(
                height: 18,
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 38, bottom: 12),
          child: Text(
            "Jadwal Kendaraan",
            style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listJadwal.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) => JadwalItem(
                    jadwal: listJadwal[index],
                  )),
        )
      ],
    );
  }
}
