import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quran/viewmodel/surah_view_model.dart';

class DetailSurah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SurahViewModel surahViewModel = context.watch<SurahViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Surah"),
      ),
      body: Column(
        children: [
          Text("Surah "),
          Text(surahViewModel.selectedSurah.englishName!),
        ],
      ),
    );
  }
}
