import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //
          UserAccountsDrawerHeader(
            accountName: Text("Shantanu soam"),
            accountEmail: Text("Shantanusoam@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1599687351724-dfa3c4ff81b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Account"),
            subtitle: Text("Personal"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("Shantanusoam@gmail.com"),
            trailing: Icon(Icons.send),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm_rounded),
            title: Text("Alarm"),
            subtitle: Text("Timeing"),
            trailing: Icon(Icons.settings),
          ),
          ListTile(
            leading: Icon(Icons.confirmation_num),
            title: Text("conf no"),
            subtitle: Text("##########"),
            trailing: Icon(Icons.read_more),
          ),
        ],
      ),
    );
  }
}
