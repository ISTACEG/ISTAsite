import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:istasite/Admin/adminpanel.dart';
import 'package:istasite/Homepage/Homepage.dart';
import 'package:istasite/Projects/Projects.dart';
import 'InterviewExperience/InterviewExpPage1.dart';

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
      title: 'ISTA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.ACTUAL_PAGE,
    );
  }
}
