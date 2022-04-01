
abstract class BaseAPiUrl {
  static String baseApiUrl = "http://universities.hipolabs.com/";
}

abstract class MyAppUrls {
  static String fetchUniversitiesQuery(String country) {
    return BaseAPiUrl.baseApiUrl + "search?country=$country";
  }
}
