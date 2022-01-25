import 'dart:convert';
import 'dart:io';

import 'package:quran/models/surah_list_models.dart';
import 'package:quran/service/api_status.dart';
import 'package:quran/utils/constants.dart';
import 'package:http/http.dart' as http;

class SurahService {
  static Future<Object> getSurah() async {
    try {
      var url = Uri.parse(BASE_URL);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // print('Response body: ${response.body}');
        SurahListModels datum =
            SurahListModels.fromJson(jsonDecode(response.body));
        return Success(response: datum);
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 103, errorResponse: 'Unknown Error');
    }
  }
}
