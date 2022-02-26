import 'package:flutter/material.dart';
import 'package:istasite/Projects/datamod.dart';

class Details extends StatelessWidget {
  final Datamodel datamodel;
  const Details({ Key? key,required this.datamodel}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(datamodel.topics),),
      body: Column(
        children: [
          for(var i=0;i<datamodel.subtopics.length;i++)
          Text(datamodel.subtopics[i])
        ],
      ),
    );
  }
}