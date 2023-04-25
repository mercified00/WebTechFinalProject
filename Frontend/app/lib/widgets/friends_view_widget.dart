 // ignore_for_file: prefer_const_declarations, prefer_const_constructors

/*
The code in this file is used to build a widget for the page for viewing the friends in my database.
It also makes http calls to my friends REST API function
*/

 import 'dart:convert';
 import 'package:flutter/material.dart';
 import 'package:app/widgets/user_card.dart';
 import 'package:http/http.dart' as http;

class FriendView extends StatefulWidget {
  const FriendView({super.key});

  @override
  State<FriendView> createState() => _FriendViewState();
}

class _FriendViewState extends State<FriendView> {

   List<dynamic> profiles = [];

   Future<void> getPost() async{
    final url = 'https://mercychimeziewebtechfinalexam.uc.r.appspot.com/api/v1/profiles/all';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      final result = json;
      setState(() {
        profiles = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: profiles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return UserCard(user: profile);
              },
            ),
    );
  }
}