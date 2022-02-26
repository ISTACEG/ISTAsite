import'dart:ui' show lerpDouble;
import'package:flutter/material.dart';
import 'package:istasite/Projects/datamod.dart';
import 'package:istasite/Projects/detail.dart';
 
void main()
{
  runApp(Sample());
}
 class Sample extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home:Myapp(),
    );
  }
 }
 class Myapp extends StatefulWidget {
   const Myapp({ Key? key }) : super(key: key);
 
   @override
   _MyappState createState() => _MyappState();
 }
 
 class _MyappState extends State<Myapp> {
   final List<Datamodel> data=[Datamodel(['aa','bb','cc'],'Ml'),Datamodel(['xx','yy','zz'],'AI')];
   
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('Sample'),),
       body:ListView.builder(
         itemCount: data.length,
         itemBuilder:(context,index){
           return Card(
             child:ListTile(
               title: Text(data[index].topics),
               leading:SizedBox(
                 width: 50,
                 height: 50,
               ),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Details(datamodel: data[index],)));
                 },
            ),
           );
         })
     );
   }
 }