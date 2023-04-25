// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, avoid_print

/*
The code in this file is used to build a widget for the page that performs the functionality of 
edit profile.
It makes http calls to the edit profile REST API in the backend
Also, when the user logs in, it uses a state manager from flutter called riverpod to be aware of
the user who is logged in.
*/

import 'dart:convert';
import 'package:app/providers/userprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileCard extends ConsumerWidget {
  
  TextEditingController residencyController = TextEditingController();
  TextEditingController movieController = TextEditingController();
  TextEditingController foodController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController yeargroupController = TextEditingController();
  TextEditingController majorController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void editProfile() async{

      Map body = ref.watch(userProvider);
      body['best food'] = foodController.text;
      body['best movie'] = movieController.text;
      body['campus residency'] = residencyController.text;
      body['dob'] = dobController.text;
      body['major'] = majorController.text;
      body['year_group'] = yeargroupController.text;

      final response = await http.put(
        Uri.parse("https://mercychimeziewebtechfinalexam.uc.r.appspot.com/api/v1/profiles/${ref.watch(userProvider)['student_id']}"),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'}
      );
      final updatedUser = jsonDecode(response.body)['data'][0];
      print(updatedUser);
      ref.read(userProvider.notifier).state = updatedUser;

      foodController.clear();
      movieController.clear();
      residencyController.clear();
      dobController.clear();
      majorController.clear();
      yeargroupController.clear();

    }
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(
          width: 450,
          child: Column(
          children: [
            CircleAvatar(
                  backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/beauty-female-portrait-decorated-colorful-flowers-smiling-young-woman-avatar-girl-pink-hair-beauty-female-portrait-212338355.jpg"),
                  radius: 50,
            ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(height: 20,),
            Text("NAME: " "${ref.watch(userProvider)['name']}" " " " " " " "",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ) ,
            Text("EMAIL: " "${ref.watch(userProvider)['email']} " " " " " " " "",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text("ID: " "${ref.watch(userProvider)['student_id']}" " " " " " " " ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text("YEAR-GROUP: " "${ref.watch(userProvider)['year_group']}" " " " " " " " ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text("BEST FOOD: " "${ref.watch(userProvider)['best food']}" " " " " " " " ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text("BEST MOVIE: " "${ref.watch(userProvider)['best movie']}" " " " " " " " ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text("DOB: " "${ref.watch(userProvider)['dob']}" " " " " " " " ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text("RESIDENCE: " "${ref.watch(userProvider)['campus residency']}" " " " " " " " ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Text("MAJOR: " "${ref.watch(userProvider)['major']}" " " " " " " " ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
              ],
            ),
            
            SizedBox(height: 15,),
           TextField(
                controller: foodController,
                decoration: InputDecoration(
                hintText: "Favourite Food",
                border: OutlineInputBorder(),
                ),
            ),
            SizedBox(height: 4,),
            TextField(
                controller: movieController,
                decoration: InputDecoration(
                hintText: "Favourite Movie",
                border: OutlineInputBorder(),
                ),
            ),
            SizedBox(height: 4,),
            TextField(
                controller: residencyController,
                decoration: InputDecoration(
                hintText: "Residence",
                border: OutlineInputBorder(),
                ),
            ),

            SizedBox(height: 4,),
            TextField(
                controller: dobController,
                decoration: InputDecoration(
                hintText: "Date of Birth",
                border: OutlineInputBorder(),
                ),
            ),

            SizedBox(height: 4,),
            TextField(
                controller: majorController,
                decoration: InputDecoration(
                hintText: "Major",
                border: OutlineInputBorder(),
                ),
            ),

            SizedBox(height: 4,),
            TextField(
                controller: yeargroupController,
                decoration: InputDecoration(
                hintText: "Year Group",
                border: OutlineInputBorder(),
                ),
            ),

            SizedBox(height: 4,),
            ElevatedButton(onPressed: (){
              editProfile();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit profile successful')),
                );
            }, 
            child: Text("Edit Profile and Save"))
          ],
        )),
              ]),
    );
    
  }
}