// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

/*
The code in this file is used to build a widget for how my web application is supposed to look like
*/

import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final Widget main;
  final Widget left;
  const Layout({super.key, required this.main, required this.left});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Spacer(),
          Flexible(
            flex: 2,
            child: Container( 
             
              child: widget.left,
            )
          
          ), 
          Container(
              width: 700,
            padding: EdgeInsets.symmetric(horizontal: 15),
             decoration: BoxDecoration(
                
                border: Border(
                  left: BorderSide(color: Colors.grey, width: 0.3),
                   right: BorderSide(color: Colors.grey, width: 0.3)
                )
              ),
            child: widget.main
          ),
          
      ],)
    );
  }
}