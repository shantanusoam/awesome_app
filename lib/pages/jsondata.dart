import 'package:flutter/material.dart';

class Jsondata extends StatefulWidget {
  @override
  _JsondataState createState() => _JsondataState();
}

class _JsondataState extends State<Jsondata> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('laod_json/'),
        )),
      )
    );
  }
}
