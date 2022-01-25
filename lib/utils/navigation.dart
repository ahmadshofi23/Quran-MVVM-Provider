import 'package:flutter/material.dart';
import 'package:quran/ui/detail_surah.dart';

void openSurahDetail(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailSurah(),
    ),
  );
}
