import 'package:my_university/model/university_model.dart';

abstract class UniversityState
{

}
class UniversityInitialState extends UniversityState
{
}
class UniversityLoadedState extends UniversityState
{

  List<University>? universityGroup = [];
  UniversityLoadedState({this.universityGroup});


}
class UniversityResultState extends UniversityState
{
  List<University>? universityGroup = [];
  UniversityResultState({this.universityGroup});
}

