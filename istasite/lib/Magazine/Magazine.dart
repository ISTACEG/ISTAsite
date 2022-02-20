import 'package:flutter/material.dart';

class Magazine extends StatefulWidget {
  const Magazine({Key? key}) : super(key: key);

  @override
  _MagazineState createState() => _MagazineState();
}

class _MagazineState extends State<Magazine> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Magazine")));
  }
}
