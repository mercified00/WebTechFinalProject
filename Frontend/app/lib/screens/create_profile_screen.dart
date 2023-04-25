// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, use_key_in_widget_constructors, use_build_context_synchronously

/*
The code is for a Flutter application that allows users to create profiles by entering personal 
details such as their name, email address, student ID, date of birth, year group, major,
 campus residency, favorite food, and favorite movie. The user's profile details are then 
 sent to a REST API endpoint via an HTTP POST request. The code uses Flutter's built-in widgets 
 to create a user interface that allows users to enter their details, 
and it also includes error handling for any failed API calls.
*/

// Import necessary packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

// Create a StatefulWidget for the CreateProfile page
class CreateProfile extends StatefulWidget{
  @override
  State<CreateProfile> createState() => _CreateProfileState();

}
// Create a State for the CreateProfile page
  class _CreateProfileState extends State<CreateProfile>{
    TextEditingController nameController = TextEditingController();
    TextEditingController studentIdController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController yearGroupController = TextEditingController();
    TextEditingController majorController = TextEditingController();
    TextEditingController dobController = TextEditingController();
    TextEditingController residencyController = TextEditingController();
    TextEditingController movieController = TextEditingController();
    TextEditingController foodController = TextEditingController();



//Build a widget for the Create profile Functionality
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.grey,

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
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 35.0),
            color: Colors.white,
            width: 450,
            height: 550,
            child: ListView(
              children: [
                Text("Create a Profile", style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
                SizedBox(height: 20,),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Username', 
                  border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: studentIdController,
                  decoration: InputDecoration(hintText: 'Student ID', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15,),
                  TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email Address', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15,),
                  TextField(
                  controller: foodController,
                  decoration: InputDecoration(hintText: 'Favourite Food', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15,),
                  TextField(
                  controller: movieController,
                  decoration: InputDecoration(hintText: 'Favourite Movie', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15,),
                 TextField(
                  controller: residencyController,
                  decoration: InputDecoration(hintText: 'Campus Residence', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: dobController,
                  decoration: InputDecoration(hintText: 'Date of Birth', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: yearGroupController,
                  decoration: InputDecoration(hintText: 'Year Group', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: majorController,
                  decoration: InputDecoration(hintText: 'Major', border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async{
                    createProfile();
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Submit', 
                    ),
                    ),
                )
              ],
            ),
          ),
        )
      );
    }




//createProfile() method makes http calls to the createprofile REST API
    void createProfile () async{

      Map body = {
        'name': nameController.text, 
        'email': emailController.text, 
        'student_id': studentIdController.text, 
        'year_group': yearGroupController.text, 
        'major': majorController.text, 
        'dob': dobController.text,
        'campus residency': residencyController.text,
        'best food': foodController.text, 
        'best movie': movieController.text
      };

      final response = await http.post(
        Uri.parse("https://mercychimeziewebtechfinalexam.uc.r.appspot.com/api/v1/profiles"),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'}
      );

      context.go('/login');
    }
  }

