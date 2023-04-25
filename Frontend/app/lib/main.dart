// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:app/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyA2i2e9kP91-lzu6ErQatLvf-2lYSHx6tA",
      appId: "1:41848854327:web:f54b7b82e3b9fd4938ecb2", 
      messagingSenderId:"41848854327", 
      projectId: "mercychimeziewebtechfinalexam"
      
    )
  );
  runApp(
   const ProviderScope( child: app())
  ); 
}

class app extends StatelessWidget{
  const app({super.key});


  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      //debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routerConfig: router,

    ); 

  }
}