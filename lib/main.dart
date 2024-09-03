// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'login.page.dart';
import 'register.page.dart';
import 'chat.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      routes: {
        "/login":(context) => LoginPage(),
        "/register":(context) => RegisterPage(),
        "/chat": (context) => ChatPage(),
      },
      initialRoute: '/login',
    );
  }
}
