import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_university/university_bloc/university_bloc.dart';
import 'package:my_university/university_bloc/university_event.dart';
import 'package:my_university/university_bloc/university_repo.dart';
import 'package:my_university/university_bloc/university_state.dart';
import 'package:sizer/sizer.dart';

import 'screens/home_screen.dart';
void main(){
  runApp(Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
       home: MultiBlocProvider(providers:
       [
         BlocProvider(create:
             (context)=>UniversityBloc(UniversityInitialState(),UniversityFromRepo()
         )..add(UniversityRetirveEvent())),
       ],
       child: const JordanUniversities()),
       debugShowCheckedModeBanner: false,
                )));
}

