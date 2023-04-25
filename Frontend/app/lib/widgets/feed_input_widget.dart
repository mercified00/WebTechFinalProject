 // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, prefer_final_fields, avoid_print, avoid_unnecessary_containers, invalid_return_type_for_catch_error

/*
The code in this file is used to build a widget for the page that performs the functionality of create post
 using cloud firestore. It is serverless and not using any API
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedInput extends StatefulWidget {
  const FeedInput({super.key});

  @override
  State<FeedInput> createState() => _FeedInputState();
}

class _FeedInputState extends State<FeedInput> {

  TextEditingController _textController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void createPost ()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference posts  = firestore.collection('posts');
    return posts
              .add({
                'email': _emailController.text, 
                'text': _textController.text, 
                'timestamp': FieldValue.serverTimestamp()
              })
              .then((value) {print("Post Added");
              _textController.clear();
             _emailController.clear();
              })
              .catchError((error) => print("Failed to add post: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: _emailController
                    ,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      // ignore: prefer_const_constructors
                      border: OutlineInputBorder()
                    ),
                  
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: _textController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "Post Something",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder()
                    ),
                  
                  ),
                ],
              ),
            )
          ]),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async  {
                  createPost();
              }, 
              child: Text("Post")),
            ],
          )
        ],
      ),
    );
  }
}