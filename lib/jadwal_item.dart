import 'package:flutter/material.dart';

class JadwalItem extends StatelessWidget {
  const JadwalItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: const [
              Text(
                "Bondowoso - Maesan",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              Text("Hari ini, 08:00 - 10:00")
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
    );
  }
}
