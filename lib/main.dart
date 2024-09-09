// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'login.page.dart';
import 'register.page.dart';
import 'chat.page.dart';

import 'package:firebase_core/firebase_core.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBUAFIc7MwrKb87f2dZCDuoyjaO0-4ngSQ",
    authDomain: "chat-15b34.firebaseapp.com",
    projectId: "chat-15b34",
    storageBucket: "chat-15b34.appspot.com",
    messagingSenderId: "632880325387",
    appId: "1:632880325387:web:6a25137d34c031c216f80e",
    measurementId: "G-9VYHYE243R");

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: firebaseConfig);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/chat": (context) => ChatPage(),
      },
      initialRoute: '/login',
    );
  }
}
