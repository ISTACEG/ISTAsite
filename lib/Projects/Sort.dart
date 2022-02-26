import 'package:flutter/material.dart';

// class sort extends StatefulWidget {
//   const sort({ Key? key }) : super(key: key);

//   @override
//   State<sort> createState() => _sortState();
// }

// class _sortState extends State<sort> {
//   @override
//     bool pressAction = true;
//   bool pressAction1 = true;
//   bool pressAction2 = true;
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Row(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start ,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: width*0.65,
//                   child: Text('this contet for others'),
//                 ),

//               ],
//             )
//           ],
//         ),
//     );
//   }
// }
Widget Sort (double width ,double height ,BuildContext context){
 
  bool pressAction=false;
   bool pressAction1=false;
    bool pressAction2=false;

                  return Container(
                  width:width*0.30,
                  child:
                   Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height*0.15,  
                        ),
                        
                      Container(
                        
                        child: Text("Sort By",style: TextStyle(color:Color.fromARGB(255, 0, 0, 0),fontWeight:FontWeight.bold,fontSize:18,height: 3 ),),
                        
                      ),
                      Container(
                        
                        child: Row(
                          children: [
                            Container(
                              child: Material(
                                child: InkWell(
                                  onTap: (() {
                                 pressAction=!pressAction;
                                //  setState(() {});
                                 print(pressAction);
                                 }),
                                 child: Container(
                                    padding: EdgeInsets.symmetric(vertical: height*0.012, horizontal: 51), 
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(237, 237, 237, 1),
                                          border: Border.all(color:pressAction?Color.fromRGBO(196, 196, 196, 1):Colors.black,),borderRadius:BorderRadius.circular(15)
                                                  ),
                                                
                                        child: Text('A-Z',style: TextStyle(fontWeight:FontWeight.bold),)
                            
                                 ),
                                ),
                              ),
                            ),
                            SizedBox(width: width*0.01,),
                            Container(
                              child: Material(
                                child: new InkWell(
                                  onTap: ((){
                                     pressAction1=!pressAction1;
                                      // setState(() {});
                                      print(pressAction1);
                                  }),
                                  child: Container(
                                     padding: EdgeInsets.symmetric(vertical: height*0.012, horizontal: 20),  
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(237, 237, 237, 1),
                                          border: Border.all(color:pressAction1?Color.fromRGBO(196, 196, 196, 1):Colors.black,),borderRadius:BorderRadius.circular(15)
                                                  ),
                                                
                                        child: Text('Latest-Oldest',style: TextStyle(fontWeight:FontWeight.bold),)
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(  
                       child: Material(
                            child:InkWell(
                              onTap: (() {
                                pressAction2=!pressAction2;
                                // setState(() {});
                                print(pressAction);
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: height*0.012, horizontal: 20), 
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(237, 237, 237, 1),
                                border: Border.all(color:pressAction2?Color.fromRGBO(196, 196, 196, 1):Colors.black,),borderRadius:BorderRadius.circular(15)
                                      ),
                                    
                            child: Text('Oldest- Latest',style: TextStyle(fontWeight:FontWeight.bold),)
                              ),
                            )
                        )
                      ),
                    
                      
                    ],
                  ),
                );

}