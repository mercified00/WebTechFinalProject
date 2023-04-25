// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

/*

The code below defines a stateful widget called `HomeScreen` which extends `StatefulWidget`. 
It imports three custom widget classes from the `app/widgets` directory, namely `Layout`, `LeftSideBar`,
and `ViewFeed`, as well as the `material.dart` package from Flutter. The `HomeScreen` widget creates 
an AppBar with a logo and title, and sets the body to a new instance of the `Layout` widget. 
The `Layout` widget takes two arguments, a `ViewFeed` widget and a `LeftSideBar` widget. 
This means that when the `HomeScreen` widget is displayed on a screen, it will render a layout
containing a sidebar on the left and a feed of posts in the main content area.
*/

import 'package:app/widgets/layout_widget.dart';
import 'package:app/widgets/left_bar_widget.dart';
import 'package:app/widgets/feed_post.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Layout(main: ViewFeed(), left: LeftSideBar())
    );
    
    
  }
}