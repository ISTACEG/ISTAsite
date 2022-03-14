import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:istasite/Homepage/Homepage.dart';
import 'package:istasite/InterviewExperience/InterviewExperience.dart';
import 'package:istasite/Magazine/Magazine.dart';
import 'package:istasite/Projects/Projects.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBhh4duiBUI58vDAMt_HZloA285uTBr4C4",
          authDomain: "istawebsite.firebaseapp.com",
          projectId: "istawebsite",
          storageBucket: "istawebsite.appspot.com",
          messagingSenderId: "536058345928",
          appId: "1:536058345928:web:4f46c573298462ed05e8fd",
          measurementId: "G-LRN8V82658"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISTA Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                child: Text("HomePage")),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Projects()));
                },
                child: Text("Projects")),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Magazine()));
                },
                child: Text("Magazine")),
            SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InterviewExperience()));
                },
                child: Text("Interview Experience"))
          ]),
    );
  }
}
