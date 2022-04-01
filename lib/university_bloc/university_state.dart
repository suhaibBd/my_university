import 'dart:io';

import 'package:my_university/model/university_model.dart';

abstract class UniversityState
{

}
class UniversityInitialState extends UniversityState
{
UniversityInitialState()
{
  print("imcalled");
}
}
class UniversityLoadingState extends UniversityState
{
  UniversityLoadingState()
  {

    print("data Lading");
  }
}
class UniversityLoadedState extends UniversityState
{

  List<University>? universityGroup = [];
  // get universityGroupGetter  => universityGroup;
  UniversityLoadedState({this.universityGroup});
  @override
  List<University>? get props => universityGroup;


}
class UniversityErrorLoadingState extends UniversityState
{
  String? Err;
  UniversityErrorLoadingState({this.Err});
}
class UniversityNoResultState extends UniversityState
{
  String? Err;
  UniversityNoResultState({this.Err});
}
class UniversityResultState extends UniversityState
{
  List<University>? universityGroup = [];
  UniversityResultState({this.universityGroup});
}

