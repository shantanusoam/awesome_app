import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Awesome App",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome App"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            boxShadow: [BoxShadow(color: Colors.grey[400],blurRadius: 6, offset: Offset(2.0,5.0))],
            color: Colors.pinkAccent,
            gradient: LinearGradient(
                colors: [Colors.yellow, Colors.pink])
          ),
          child: Text("Iam Sristhi",
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),),
        ),
      ),

    );
  }
}
