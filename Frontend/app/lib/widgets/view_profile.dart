// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors

/*
This code defines a widget in Flutter called `myProfileView`, which is 
a stateless widget that displays a single child widget called `myProfileCard` 
inside a `ListView` wrapped in a `Container`. The code also imports the
`view_profile_widget.dart` file and the Flutter material package
*/

import 'package:app/widgets/view_profile_widget.dart';
import 'package:flutter/material.dart';

class myProfileView extends StatelessWidget {
  const myProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          myProfileCard()
        ],
      ),
    );
  }
}




