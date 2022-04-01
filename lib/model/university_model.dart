// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);

import 'dart:convert';

List<University> universityFromJson(String str) => List<University>.from(json.decode(str).map((x) => University.fromJson(x)));


class University {
  University({
    this.country,
    this.name,
    this.domains,
    this.alphaTwoCode,
    this.stateProvince,
    this.webPages,
  });

  Country? country;
  String? name;
  List<String>? domains;
  AlphaTwoCode? alphaTwoCode;
  dynamic stateProvince;
  List<String>? webPages;

  factory University.fromJson(Map<String, dynamic> json) => University(
    country: countryValues.map![json["country"]],
    name: json["name"],
    domains: List<String>.from(json["domains"].map((x) => x)),
    alphaTwoCode: alphaTwoCodeValues.map![json["alpha_two_code"]],
    stateProvince: json["state-province"],
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
  );


}

enum AlphaTwoCode { jo }

final alphaTwoCodeValues = EnumValues({
  "JO": AlphaTwoCode.jo
});

enum Country { jordan }

final countryValues = EnumValues({
  "Jordan": Country.jordan
});

class EnumValues {
  Map? map;
  Map? reverseMap;

  EnumValues(this.map);

  Map get reverse {
    reverseMap ??= map!.map((k, v) =>  MapEntry(v, k));
    return reverseMap!;
  }
}
