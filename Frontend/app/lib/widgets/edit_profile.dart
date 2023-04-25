/*
The code in this file is used to build a widget for the profile page
*/

import 'package:app/widgets/edit_profile_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ProfileCard()
        ],
      ),
    );
  }
}