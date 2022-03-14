import 'package:flutter/material.dart';
import 'Search.dart';
import 'Projectsform.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return const Projectform();
  }
}
