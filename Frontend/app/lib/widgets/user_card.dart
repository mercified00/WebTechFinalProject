// ignore_for_file: prefer_const_constructors

/*
The code in this file is used to build a widget for the page that allows you see friends and their 
information.
*/

import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final Map user;
  const UserCard({super.key, required this.user});

 @override
Widget build(BuildContext context) {
  
  return Center(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                "https://clinics.law.harvard.edu/wp-content/uploads/2019/07/Twitter_Logo_WhiteOnImage.png"),
            radius: 20,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user['name']}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
              ),
              Text("${user['email']}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),),
              Text(
                  "Student ID: ${user['student_id']} \nFavorite movie: ${user['best movie']}\nFavourite Food: ${user['best food']} \nDate of Birth: ${user['dob']} \nResidence: ${user['best food']} \nMajor: ${user['major']} \nYear Group: ${user['year_group']}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

}

