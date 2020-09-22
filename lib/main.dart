import 'package:awesome_app/pages/home_page.dart';
import 'package:awesome_app/pages/loginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Shrishtis App",
    home: LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => HomePage(),
    },
  ));
}
