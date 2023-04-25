 // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

/*
The code in this file is used to build a widget for layout of the left bar which has links to the other 
pages. 
*/

import 'package:app/providers/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LeftSideBar extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(17.0)),
                iconSize: MaterialStateProperty.all(30.0)
              ),
              icon: Icon(
              Icons.home,

              ), label: Text('Home', style: TextStyle(
              fontSize: 23
            ),), onPressed: (){
              context.go('/home');
            },),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(17.0)),
                iconSize: MaterialStateProperty.all(30.0)
              ),
              icon: Icon(
              Icons.person,
              ), label: Text('View Profile', style: TextStyle(
              fontSize: 23
            ),), onPressed: (){
              context.go('/view');
            },),
          ), 
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(17.0)),
                iconSize: MaterialStateProperty.all(30.0)
              ),
              icon: Icon(
              Icons.edit,
              ), label: Text('Edit Profile', style: TextStyle(
              fontSize: 23
            ),), onPressed: (){
              context.go('/profile');
            },),
          ), 
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(17.0)),
                iconSize: MaterialStateProperty.all(30.0)
              ),
              icon: Icon(
              Icons.people,
              ), label: Text('Friends', style: TextStyle(
              fontSize: 23
            ),), onPressed: (){
              context.go('/friends');
            },),
          ), 
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextButton.icon(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(17.0)),
                iconSize: MaterialStateProperty.all(30.0)
              ),
              icon: Icon(
              Icons.exit_to_app,

              ), label: Text('Logout', style: TextStyle(
              fontSize: 23
            ),), onPressed: (){
              ref.read(userProvider.notifier).state = {};
              context.go('/login');
            },),
          ),
      ],)
    );
  }
}