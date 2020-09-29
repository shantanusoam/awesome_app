import 'package:awesome_app/pages/SplashScreen.dart';
import 'package:awesome_app/pages/home_page.dart';
import 'package:awesome_app/pages/home_page_with_fb.dart';
// import 'package:awesome_app/pages/homepagewithstreambuilder.dart';
import 'package:awesome_app/pages/loginPage.dart';
import 'package:awesome_app/pages/MagicVoiceChanger.dart';
import 'package:awesome_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int splashscreen = 0;
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    title: "Shrishtis App",
    home: Constants.prefs.getBool("LoggedIn") == true && splashscreen == 0
        ? HomePageFB()
        : SplashScreen(),
    // theme: ThemeData(
    //   primarySwatch: Colors.purple,
    // ),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => HomePage(),
      "/voice": (context) => MagicVoiceChanger()
    },
  ));
}
