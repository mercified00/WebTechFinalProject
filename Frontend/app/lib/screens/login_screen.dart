// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, use_key_in_widget_constructors, must_be_immutable, use_build_context_synchronously, avoid_print


/*
The code is a Flutter widget used to build the login page for a web application.
It enables users to input their email address and year group, which is then sent as
a JSON request to a REST API on the backend. Upon successful response, the user 
is redirected to the home page of the web application. The widget also displays
the logo of the web application on the app bar and has a white container that houses 
the login form for the user.
*/

import 'dart:convert';
import 'package:app/providers/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget{
    TextEditingController emailController = TextEditingController();
    TextEditingController yearGroupController= TextEditingController();
    
    @override
    Widget build(BuildContext context, WidgetRef ref){

      void login () async{

      Map body = {
        'email': emailController.text, 
        'year_group': yearGroupController.text, 
      };

      final response = await http.post(
        Uri.parse("https://mercychimeziewebtechfinalexam.uc.r.appspot.com/api/v1/login"),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'}
      );
      print(response);
      ref.read(userProvider.notifier).state = jsonDecode(response.body);
      context.go('/home');
    }
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
            height: 350,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Login", style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email Address', 
                  border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: yearGroupController,
                  decoration: InputDecoration(hintText: 'Year group', border: OutlineInputBorder()),
                ),
                
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    login();
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
}