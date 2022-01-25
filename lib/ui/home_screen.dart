import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quran/models/surah_list_models.dart';
import 'package:quran/ui/widgets/app_loading.dart';
import 'package:quran/ui/widgets/surah_list_row.dart';
import 'package:quran/utils/navigation.dart';
import 'package:quran/viewmodel/surah_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SurahViewModel surahViewModel = context.watch<SurahViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Surah"),
      ),
      body: Column(
        children: [
          _ui(surahViewModel),
        ],
      ),
    );
  }
}

_ui(SurahViewModel surahViewModel) {
  if (surahViewModel.loading) {
    return AppLoading();
  }

  return Expanded(
      child: ListView.separated(
    itemCount: surahViewModel.datum.length,
    itemBuilder: (context, index) {
      Datum datum = surahViewModel.datum[index];
      return SurahListRow(
        datum: datum,
        onTap: () async {
          surahViewModel.setSelectedSurah(datum);
          openSurahDetail(context);
        },
      );
    },
    separatorBuilder: (BuildContext context, int index) => Container(),
  ));
}
