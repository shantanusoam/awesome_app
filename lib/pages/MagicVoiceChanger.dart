import 'package:flutter/material.dart';
import 'package:voice_changer_plugin/voice_changer_plugin.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// import 'package:ext_storage/ext_storage.dart';

class MagicVoiceChanger extends StatefulWidget {
  @override
  _MagicVoiceChangerState createState() => _MagicVoiceChangerState();
}

class _MagicVoiceChangerState extends State<MagicVoiceChanger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magic Voice Changer"),
      ),
      body: FutureBuilder(
        future: _getAudioFiles(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("Click TO Start");
              break;
            case ConnectionState.waiting:
              return Text("Awaiting for Result");
              break;
            case ConnectionState.active:
              return Text("Click TO Start");
              break;
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text('Snapshot error : ${snapshot.error}');
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    if (p
                        .extension(snapshot.data[i].absolute.path)
                        .replaceFirst(".", "")
                        .endsWith("mp3")) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            VoiceChangerPlugin.change(
                                snapshot.data[i].absolute.path, 4);
                          },
                          title: Text(snapshot.data[i].absolute.path),
                          subtitle: Text(
                              'Extention: ${p.extension(snapshot.data[i].absolute.path).replaceFirst(".", "")}'),
                        ),
                      );
                    } else {
                      return Center(child: Text("No Mp3 found"));
                    }
                  },
                );
              } else {
                return Center(child: Text("Nothing"));
              }
          }
          return null;
        },
      ),
    );
  }

  _getAudioFiles() async {
    var root = await getExternalStorageDirectory();
    var files = await FileManager(root: root).filesTree(extensions: ["mp3"]);
    return files;
  }
}

// class _VoicePageState extends State<VoicePage> {
//   final userNameController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("VoicePage"),
//         ),
//         body: Stack(
//           fit: StackFit.expand,
//           children: [
//             BgImage(),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SingleChildScrollView(
//                   child: Card(
//                     child: Column(
//                       children: <Widget>[
//                         Column(
//                           children: [
//                             MagicVoiceChanger(),
//                             TextFormField(
//                               decoration: InputDecoration(
//                                   hintText: "Enter Username",
//                                   labelText: "Username"),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             TextFormField(
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                   hintText: "Enter Password",
//                                   labelText: "Password"),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: RaisedButton(
//                             onPressed: () {
//                               //   Navigator.push(
//                               //       context,
//                               //       MaterialPageRoute(
//                               //           builder: (context) => HomePage()));
//                               Constants.prefs.setBool("LoggedIn", true);

//                               Navigator.pushReplacementNamed(context, "/home");
//                             },
//                             child: Text("Sign in"),
//                             color: Colors.orange,
//                             textColor: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
