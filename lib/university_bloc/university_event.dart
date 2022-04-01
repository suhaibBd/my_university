abstract class UniversityEvent {}

class UniversityRetirveEvent extends UniversityEvent {}

class UniversitySearchEvent extends UniversityEvent {
  String? keyWordSearchQuery;
  UniversitySearchEvent({this.keyWordSearchQuery});
}
