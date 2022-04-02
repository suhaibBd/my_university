import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../custom_widgets/custom_card.dart';
import '../custom_widgets/custom_textfield.dart';
import '../university_bloc/university_bloc.dart';
import '../university_bloc/university_event.dart';
import '../university_bloc/university_state.dart';

class JordanUniversities extends StatelessWidget {
  const JordanUniversities({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CustomTextField.textField('Enter name / domain',onChange: (queryValue){
                BlocProvider.of<UniversityBloc>(context)
                    .add(UniversitySearchEvent(keyWordSearchQuery: queryValue));
              },radius: 10.h,width: 90.w,verPadding: 5.w,horzPadding: 10.w,
              hasSuffixIcon: true,
                suffixIcon: Icon(Icons.search,color: Colors.grey..shade800,)
              ),
            ),

            BlocBuilder<UniversityBloc, UniversityState>(
                builder: (context, state) {
              if (state is UniversityLoadedState) {
                return UniversitiesCard(university:state);
              }
              if (state is UniversityResultState) {
                return UniversitiesCard(university:state);
              }
              return const CircularProgressIndicator(
                color: Colors.blue,
              );
            }),
          ],
        ),
      ),
    );
  }
}

