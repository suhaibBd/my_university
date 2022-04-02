import 'dart:math';

import 'package:flutter/material.dart';

import '../screens/web_pages.dart';

class UniversitiesCard extends StatelessWidget
{
  var university;
  UniversitiesCard({Key? key, required this.university}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: university.universityGroup!.length,
            itemBuilder: (context, Universityindex) {
              return InkWell(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(university.universityGroup![Universityindex].name![0],
                      style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
                  title: Text(university.universityGroup![Universityindex].name!),
                  subtitle: ListView.builder(
                    shrinkWrap: true,
                    itemCount: university.universityGroup![Universityindex].domains!.length,
                    itemBuilder: (ctx, domainsIndex){
                      return Text(university.universityGroup![Universityindex].domains![domainsIndex]);
                    },
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WebPageScreen(
                    universitySite: university.universityGroup![Universityindex].webPages.first,

                  )));
                },
              );
            }),
      ));

  }
}