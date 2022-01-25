import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:quran/models/surah_list_models.dart';
import 'package:quran/service/api_status.dart';
import 'package:quran/service/surah_service.dart';

class SurahViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<SurahListModels> _surahListModel = [];
  List<Datum> _datum = [];
  late Datum _selectedSurah;

  bool get loading => _isLoading;
  List<SurahListModels> get surahListModel => _surahListModel;
  List<Datum> get datum => _datum;
  Datum get selectedSurah => _selectedSurah;

  SurahViewModel() {
    getSurahList();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setSurahListModel(List<SurahListModels> surahModelList) {
    _surahListModel = surahModelList;
  }

  setDatumListModel(List<Datum> datumList) {
    _datum = datumList;
  }

  setSelectedSurah(Datum datum) {
    _selectedSurah = datum;
  }

  getSurahList() async {
    setLoading(true);
    var response = await SurahService.getSurah();
    // print("Respon viewModel : ${response} ");
    if (response is Success) {
      setDatumListModel((response.response as SurahListModels).data!);
      // print("Respon dan Respons : ${response.response}");
    }
    setLoading(false);
  }
}
