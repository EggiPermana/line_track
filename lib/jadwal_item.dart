import 'package:flutter/material.dart';
import 'package:line_track/core/respon/response_jadwal.dart';
import 'package:line_track/jadwal.dart';

class JadwalItem extends StatelessWidget {
  final Jadwal jadwal;
  const JadwalItem({Key? key, required this.jadwal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JadwalScreen(jadwal: jadwal,) ));
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //K
            const CircleAvatar(
              child: Icon(Icons.car_rental),
            ),
            const SizedBox(width: 12,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  '${jadwal.from} - ${jadwal.to}',
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text("${jadwal.day}, ${jadwal.startTime} - ${jadwal.endTime}")
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(18)),
              child: Center(
                child: Text(
                  "IDR 10.000",
                  style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
