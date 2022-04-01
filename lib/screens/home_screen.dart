import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../university_bloc/university_bloc.dart';
import '../university_bloc/university_event.dart';
import '../university_bloc/university_state.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                decoration: const InputDecoration(hintText: "search"),
                onChanged: (value) {
                  BlocProvider.of<UniversityBloc>(context)
                      .add(UniversitySearchEvent(keyWordSearchQuery: value));
                }),
            BlocBuilder<UniversityBloc, UniversityState>(
                builder: (context, state) {
              if (state is UniversityLoadingState) {
                return const CircularProgressIndicator(
                  color: Colors.red,
                );
              }
              if (state is UniversityErrorLoadingState) {
                return const CircularProgressIndicator(
                  color: Colors.yellow,
                );
              }

              if (state is UniversityLoadedState) {
                return Expanded(
                  child: Card(
                    elevation: 5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.universityGroup!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(backgroundColor: Colors.red,),
                            title: Text(state.universityGroup![index].name!),
                            subtitle: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.universityGroup![index].domains!.length,
                              itemBuilder: (ctx, indexx){
                                return Text(state.universityGroup![index].domains![indexx]);
                              },
                            ),
                          );
                        }),
                  ),
                );
              }
              if (state is UniversityResultState) {
                return Expanded(
                  child: Card(
                    elevation: 5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.universityGroup!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(backgroundColor: Colors.red,),
                            title: Text(state.universityGroup![index].name!),
                            subtitle: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.universityGroup![index].domains!.length,
                              itemBuilder: (ctx, indexx){
                                return Text(state.universityGroup![index].domains![indexx]);
                              },
                            ),
                          );
                        }),
                  ),
                );
              }
              return const CircularProgressIndicator(
                color: Colors.green,
              );
            }),
          ],
        ),
      ),
    );
  }
}
// class himan
// {
//   getdata(String value)
//   {
//     print("VALVALVLAV ${value}");
//   }
// }
