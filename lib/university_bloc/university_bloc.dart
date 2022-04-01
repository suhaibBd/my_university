import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_university/university_bloc/university_event.dart';
import 'package:my_university/university_bloc/university_repo.dart';
import 'package:my_university/university_bloc/university_state.dart';
import '../model/university_model.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  List<University>? universityGroup = [];

  final UniversityFromRepo repo;
  UniversityBloc(UniversityState initialState, this.repo)
      : super(initialState) {
    on<UniversityEvent>((event, emit) async {
      if (event is UniversitySearchEvent) {
        emit(UniversityResultState(
            universityGroup:
                await UniversityFromRepo().retriveQuerySearchResult(
                    UniversitySearchEvent(
                      keyWordSearchQuery: event.keyWordSearchQuery,
                    ).keyWordSearchQuery!,
                    universityGroup!)));
      } else {
        emit(UniversityLoadedState(
            universityGroup: await UniversityFromRepo().retriveUniversities()));
        universityGroup = await UniversityFromRepo().retriveUniversities();
      }
    });
  }
}
