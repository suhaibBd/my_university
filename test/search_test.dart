import 'package:flutter_test/flutter_test.dart';
import 'package:my_university/model/university_model.dart';
import 'package:my_university/university_bloc/university_repo.dart';
void main() {
  late UniversityFromRepo _universityFromRepo;
  List<University>? universityGroup;
  List<University> result;
  getUniversities() async {
    universityGroup = await _universityFromRepo.retriveUniversities();
  }

  setUp(() async {
    _universityFromRepo = UniversityFromRepo();
    await getUniversities();
  });

  group('unit tests of search method', () {
    test('must return two university name when sent domain : (aau.edu.jo)',
        () async {
       result = await _universityFromRepo.retriveQuerySearchResult(
          'aau.edu.jo', universityGroup!);

      for (int i = 0; i < result.length; i++) {
        expect(result[i].name, 'Amman Arab University for Higher Studies',
            reason: 'No matcher between the actual result and the expected');
      }
    });

    test(
      'must return two university name when sent name of university:(Al al-Bayt University)',()async
    {
       result = await _universityFromRepo.retriveQuerySearchResult(
          'Al al-Bayt University', universityGroup!);
      for (int i = 0; i < result.length; i++) {
        expect(result[i].name, 'Al al-Bayt University',
            reason: 'No matcher between the actual result and the expectance');
      }
    }
    );
  });
}
