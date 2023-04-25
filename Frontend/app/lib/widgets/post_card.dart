// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

/*
This code defines a `PostCard` widget which displays a user's post along with their profile picture 
and email address. The `PostCard` widget is a stateful widget which takes in two required arguments:
`text`, which is the content of the post, and `email`, which is the email address of the user
who made the post. 
*/

import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {

  final String text;
  final String email;
  const PostCard({super.key, required this.text, required this.email});


  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        
      ),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage("https://clinics.law.harvard.edu/wp-content/uploads/2019/07/Twitter_Logo_WhiteOnImage.png"),
              radius: 17,
            ), 
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("User", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              Text(widget.email),
              SizedBox(height: 10,),
               Container(
                   width: 600,
                   child: Text(widget.text,
                   softWrap: true,
                   style: TextStyle(
                    fontSize: 16
                   ),
                   ),
                 )
            ],)
          ],),

         
      ],)
    );
  }
}