// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, avoid_print, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

/*
This code defines a Flutter widget called "myProfileCard", which displays a user's profile
information fetched from a remote API. The information includes the user's name, email,
student ID, year group, major, date of birth, campus residency, and favorite food and movie. 
The widget uses the http package to send an HTTP GET request to the API and retrieves a JSON 
response, which is then parsed using the Dart convert library.  
*/

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Album>  viewProfile() async{
  final response = await http.get(
    Uri.parse("https://mercychimeziewebtechfinalexam.uc.r.appspot.com/api/v1/profiles?student_id=58142024"),
  );
  if(response.statusCode == 200){
    return Album.fromJson(jsonDecode(response.body)[0]);
  }
  else{
    throw Exception('Failed to load');
  }
}

class Album {
    Album({
        required this.name,
        required this.email,
        required this.studentId,
        required this.yearGroup,
        required this.major,
        required this.dob,
        required this.campusResidency,
        required this.bestFood,
        required this.bestMovie,
    });

    String name;
    String email;
    String studentId;
    String yearGroup;
    String major;
    String dob;
    String campusResidency;
    String bestFood;
    String bestMovie;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"],
        email: json["email"],
        studentId: json["student_id"],
        yearGroup: json["year_group"],
        major: json["major"],
        dob: json["dob"],
        campusResidency: json["campus residency"],
        bestFood: json["best food"],
        bestMovie: json["best movie"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "student_id": studentId,
        "year_group": yearGroup,
        "major": major,
        "dob": dob,
        "campus residency": campusResidency,
        "best food": bestFood,
        "best movie": bestMovie,
    };
}

class myProfileCard extends StatefulWidget {
  const myProfileCard({super.key});

  @override
  State<myProfileCard> createState() => _myProfileCardState();
}
  class _myProfileCardState extends State<myProfileCard> {
    late Future<Album> futureAlbum;

    @override
    void initState(){
      super.initState();
      futureAlbum = viewProfile();
    }

     @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (BuildContext context, AsyncSnapshot<Album> snapshot) {
          if (snapshot.hasData) {
            Album album = snapshot.data!;
            return ListView(
              shrinkWrap: true,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/beauty-female-portrait-decorated-colorful-flowers-smiling-young-woman-avatar-girl-pink-hair-beauty-female-portrait-212338355.jpg"),
                  radius: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      )
                    ),
                    child: ClipOval(
                      child:Image.network(
                        "https://thumbs.dreamstime.com/b/beauty-female-portrait-decorated-colorful-flowers-smiling-young-woman-avatar-girl-pink-hair-beauty-female-portrait-212338355.jpg",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      )
                    )
                  )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                SizedBox(height: 20),
                Text(
                  "Name: ${album.name}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Email: ${album.email}",
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Student ID: ${album.studentId}",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Year Group: ${album.yearGroup}",
                   style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Major: ${album.major}",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Date of Birth: ${album.dob}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Campus Residency: ${album.campusResidency}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Best Food: ${album.bestFood}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Best Movie: ${album.bestMovie}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                  ],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  }







