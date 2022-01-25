import 'package:flutter/material.dart';
import 'package:quran/models/surah_list_models.dart';

class SurahListRow extends StatelessWidget {
  final Datum datum;
  final VoidCallback onTap;
  SurahListRow({required this.datum, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              )
            ]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Surah " + datum.englishName.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Ayat Ke : " + datum.number.toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              datum.name.toString(),
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
