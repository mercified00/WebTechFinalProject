// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

/*
This code defines a widget for a profile screen in a Flutter app. 
It imports several other widgets that it uses to construct the profile screen, 
such as a layout widget, a left sidebar widget, and a profile view widget. 
The app's title and logo are set in the app bar, and the body of the screen 
is set to display the profile view widget and the left sidebar widget using the layout widget. 
*/

import 'package:app/widgets/layout_widget.dart';
import 'package:app/widgets/left_bar_widget.dart';
import 'package:app/widgets/view_profile.dart';
import 'package:flutter/material.dart';

class myProfileScreen extends StatefulWidget {
  const myProfileScreen({super.key});

  @override
  State<myProfileScreen> createState() => _myProfileScreenState();
}
class _myProfileScreenState extends State<myProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: 40,
              image: NetworkImage("https://clinics.law.harvard.edu/wp-content/uploads/2019/07/Twitter_Logo_WhiteOnImage.png"))
            ,
            Text("Twitter for Students", 
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),),
          ],
        ),
        centerTitle: true,
      ),
      body: Layout(main: myProfileView(), left: LeftSideBar()),
    );
  }
}