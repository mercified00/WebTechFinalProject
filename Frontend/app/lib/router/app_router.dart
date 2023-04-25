// ignore_for_file: prefer_const_constructors

// The code in this file allows me to navigate between pages

import 'package:app/screens/create_profile_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/edit_profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/friends_screen.dart';
import 'package:app/screens/view_profile_screen.dart';

final router = GoRouter(
  routes: [
    
    GoRoute(
      path: '/',
      builder: (context, state) => CreateProfile(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
      
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/friends',
      builder: (context, state) => ProfilesList(),
    ),

    GoRoute(
      path: '/view',
      builder: (context, state) => myProfileScreen(),
    ),
    
  ],
);