// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

/*
The code below defines a stateful widget called `ProfilesList` which extends 
`StatefulWidget`. It imports three custom widget classes from the `app/widgets` 
directory, namely `FriendsView`, `Layout`, and `LeftSideBar`, as well as the `material.dart` 
package from Flutter. The `ProfilesList` widget creates an AppBar with a logo and title, and 
sets the body to a new instance of the `Layout` widget. The `Layout` widget takes two arguments, 
a `FriendView` widget and a `LeftSideBar` widget. This means that when the `ProfilesList` widget
is displayed on a screen, it will render a layout containing a sidebar on the 
left and a list of friends in the main content area.
*/


import 'package:app/widgets/friends_view_widget.dart';
import 'package:app/widgets/layout_widget.dart';
import 'package:app/widgets/left_bar_widget.dart';
import 'package:flutter/material.dart';

class ProfilesList extends StatefulWidget {
  const ProfilesList({super.key});
  
  @override
  State<ProfilesList> createState() => _ProfilesListState();
}
class _ProfilesListState extends State<ProfilesList> {
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
      body: Layout(main: FriendView(), left: LeftSideBar()));
  }
}
