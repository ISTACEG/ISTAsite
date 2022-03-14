import 'package:flutter/material.dart';

// class tags extends StatefulWidget {
//   const tags({ Key? key }) : super(key: key);

//   @override
//   State<tags> createState() => _tagsState();
// }

// class _tagsState extends State<tags> {
//   final List<String> entries =['Machine Learning ','Augmented Reality','Data Analysis','Deep Learning','Virtul Reality'];
//   @override
  
//   bool pressAction = true;
//   bool pressAction1 = true;
//   bool pressAction2 = true;
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: 
//       ListView.builder(
//         itemCount: entries.length,
//         itemBuilder: (context, index) {
          
//         return  Container(
//                               child: Material(
//                                 child: InkWell(
//                                   onTap: (() {
//                                  pressAction=!pressAction;
//                                  setState(() {});
//                                  print(pressAction);
//                                  }),
//                                  child: Container(
//                                     padding: EdgeInsets.symmetric(vertical: height*0.012, horizontal: 20), 
//                                         decoration: BoxDecoration(
//                                           color: Color.fromRGBO(237, 237, 237, 1),
//                                           border: Border.all(color:pressAction?Color.fromRGBO(196, 196, 196, 1):Colors.black,),borderRadius:BorderRadius.circular(15)
//                                                   ),
                                                
//                                         child: Text('${entries[index]}',style: TextStyle(fontWeight:FontWeight.bold),)
                            
//                                  ),
                                 
//                                 ),
//                               ),
//                             );
                           
         
        
//       }))   ;  
   
//   }
// }

Widget  tag(double width , double height , BuildContext context){
  bool pressAction = false;
  final List<String> entries =['Machine Learning ','Augmented Reality','Data Analysis','Deep Learning','Virtul Reality'];
        return ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          
        return  Container(
                              child: Material(
                                child: InkWell(
                                  onTap: (() {
                                 pressAction=!pressAction;
                                //  setState(() {});
                                 print(pressAction);
                                 }),
                                 child: Container(
                                    padding: EdgeInsets.symmetric(vertical: height*0.012, horizontal: 20), 
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(237, 237, 237, 1),
                                          border: Border.all(color:pressAction?Color.fromRGBO(196, 196, 196, 1):Colors.black,),borderRadius:BorderRadius.circular(15)
                                                  ),
                                                
                                        child: Text('${entries[index]}',style: TextStyle(fontWeight:FontWeight.bold),)
                            
                                 ),
                                 
                                ),
                              ),
                            );
                           
         
        
      });  
   
}