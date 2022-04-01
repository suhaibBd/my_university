import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_university/model/university_model.dart';

import '../server/server_connection.dart';

abstract class UniversityRepo {
  Future<List<University>> retriveUniversities();
}

class UniversityFromRepo extends UniversityRepo {
  http.Response? response;

  List<University>? jordanUniversities = [];

  @override
  Future<List<University>> retriveUniversities() async {
    response =
        await http.get(Uri.parse(MyAppUrls.fetchUniversitiesQuery('Jordan')));
    jordanUniversities = universityFromJson(response!.body);
    return jordanUniversities!;
  }

  Future<List<University>> retriveQuerySearchResult(
      String querySearchResult, List<University> jordanUniversities) async {
    List<University> results = [];
    if (querySearchResult.isEmpty) {
      results = jordanUniversities;
    } else {
      results = jordanUniversities
          .where((university) => university.name!.toLowerCase().contains(querySearchResult.toLowerCase()) ||
          university.domains!.where((domainSearchEnrty) => domainSearchEnrty.toLowerCase().contains(querySearchResult.toLowerCase())).toString().contains(querySearchResult.toLowerCase()))
          .toList();
      
      // results.addAll(jordanUniversities
      //     .where((university) =>
      //     university.domains.where((element) => element.toLowerCase().contains(querySearchResult.toLowerCase()))).toList());
      
       // university.domains!.where((domainSearchEnrty) => domainSearchEnrty.toLowerCase().contains(querySearchResult.toLowerCase()))
    }
    jordanUniversities = results;
    // print(jordanUniversities.first.name);
    return jordanUniversities;
  }

}
