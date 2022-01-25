// To parse this JSON data, do
//
//     final surahListModels = surahListModelsFromJson(jsonString);

import 'dart:convert';

List<SurahListModels> surahListModelsFromJson(String str) =>
    List<SurahListModels>.from(
        json.decode(str).map((x) => SurahListModels.fromJson(x)));

String surahListModelsToJson(List<SurahListModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurahListModels {
  SurahListModels({
    this.code,
    this.status,
    this.data,
  });

  int? code;
  String? status;
  List<Datum>? data;

  factory SurahListModels.fromJson(Map<String, dynamic> json) =>
      SurahListModels(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  RevelationType? revelationType;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
        englishName: json["englishName"] == null ? null : json["englishName"],
        englishNameTranslation: json["englishNameTranslation"] == null
            ? null
            : json["englishNameTranslation"],
        numberOfAyahs:
            json["numberOfAyahs"] == null ? null : json["numberOfAyahs"],
        revelationType: json["revelationType"] == null
            ? null
            : revelationTypeValues.map[json["revelationType"]],
      );

  Map<String, dynamic> toJson() => {
        "number": number == null ? null : number,
        "name": name == null ? null : name,
        "englishName": englishName == null ? null : englishName,
        "englishNameTranslation":
            englishNameTranslation == null ? null : englishNameTranslation,
        "numberOfAyahs": numberOfAyahs == null ? null : numberOfAyahs,
        "revelationType": revelationType == null
            ? null
            : revelationTypeValues.reverse[revelationType],
      };
}

enum RevelationType { MECCAN, MEDINAN }

final revelationTypeValues = EnumValues(
    {"Meccan": RevelationType.MECCAN, "Medinan": RevelationType.MEDINAN});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
