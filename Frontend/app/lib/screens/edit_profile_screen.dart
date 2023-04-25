// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

/*
This code defines a stateful widget called ProfileScreen which builds a page that enables 
editing of the user's profile in a database. 
The page includes an app bar and a body with a layout that has a left sidebar and a profile view.
*/

import 'package:app/widgets/layout_widget.dart';
import 'package:app/widgets/left_bar_widget.dart';
import 'package:app/widgets/edit_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
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
      body: Layout(main: ProfileView(), left: LeftSideBar()),
    );
  }
}