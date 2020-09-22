import 'package:awesome_app/pages/home_page.dart';
import 'package:awesome_app/pages/home_page_with_fb.dart';
import 'package:awesome_app/pages/loginPage.dart';
import 'package:awesome_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Shrishtis App",
    home: Constants.prefs.getBool("LoggedIn") == true
        ? HomePageFB()
        : LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => HomePage(),
    },
  ));
}
