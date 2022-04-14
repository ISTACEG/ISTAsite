import 'package:flutter/material.dart';

class Developer {
  String name;
  String role;
  String rollno;
  String imageurl;
  Developer(
      {required this.name,
      required this.role,
      required this.rollno,
      required this.imageurl});
}

Widget profile(List<Developer> devlist, int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.blue,
            // color: light != null
            //     ? light.toColor()
            //     : Color.fromRGBO(
            //         229, 229, 229, 1),
            borderRadius: BorderRadius.circular(360)),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: InkWell(
                // onTap: () {
                //   setState(() {
                //     isSelect = !isSelect;
                //   });
                // },
                child: Image(image: AssetImage(devlist[index].imageurl))),
          ),
        ),
      ),
      Text(devlist[index].name,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'InterBold')),
      SizedBox(height: 5),
      Text(devlist[index].role,
          style: const TextStyle(fontSize: 12, fontFamily: 'InterLight'))
    ],
  );
}

Future developersDialogBox(BuildContext context, double width, double height) {
  List<Developer> devlist = [
    Developer(
        name: "Akil Vishnu M",
        role: "Designer",
        rollno: "2018115010",
        imageurl: "Developers/Akil.jpg"),
    Developer(
        name: "Balasubramaniam M",
        role: "Mentor & Developer",
        rollno: "2018115018",
        imageurl: "Developers/Bala.jpg"),
    Developer(
        name: "Eashwar P",
        role: "Mentor",
        rollno: "2018115030",
        imageurl: "Developers/Eashwar.jpeg"),
    Developer(
        name: "Palaniappan N",
        role: "Mentor & Developer",
        rollno: "2018115066",
        imageurl: "Developers/Palani.jpeg"),
    Developer(
        name: "Sanjayram R",
        role: "Mentor",
        rollno: "2018115095",
        imageurl: "Developers/Sanjay.jpg"),
    Developer(
        name: "Selshia Teresa",
        role: "Mentor",
        rollno: "2018115099",
        imageurl: "Developers/Selshia.jpeg"),
    Developer(
        name: "Srikarthikeyan M K",
        role: "Mentor",
        rollno: "2018115110",
        imageurl: "Developers/Srikarthikeyan.jpg"),
    Developer(
        name: "Subash Raja S",
        role: "Mentor",
        rollno: "2018115112",
        imageurl: "Developers/Subash.jpg"),
    Developer(
        name: "Venkat Karthick P",
        role: "Mentor",
        rollno: "2018115125",
        imageurl: "Developers/Venkat.jpg"),
    Developer(
        name: "Aravind J",
        role: "Developer",
        rollno: "2019115017",
        imageurl: "Developers/AravindJ.jpg"),
    Developer(
        name: "Aravind S",
        role: "Developer",
        rollno: "2020115012",
        imageurl: "Developers/Aravind.jpg"),
    Developer(
        name: "Balaji A",
        role: "Developer",
        rollno: "2020115018",
        imageurl: "Developers/Balaji.jpeg"),
    Developer(
        name: "Keerthana B K",
        role: "Developer",
        rollno: "2020115041",
        imageurl: "Developers/Keerthana.jpg"),
    Developer(
        name: "Rohith S",
        role: "Developer",
        rollno: "2020115068",
        imageurl: "Developers/Rohit.jpg"),
    Developer(
        name: "Srishti Gulecha R",
        role: "Developer",
        rollno: "2020115094",
        imageurl: "Developers/Srishti.jpg"),
    Developer(
        name: "Surya R",
        role: "Developer",
        rollno: "2019115112",
        imageurl: "Developers/Surya.jpeg"),
    Developer(
        name: "Vellai Kumarappan PL",
        role: "Developer",
        rollno: "2019115119",
        imageurl: "Developers/Vellaikumarappan.jpg"),
    Developer(
        name: "Vishnutheep",
        role: "Developer",
        rollno: "2019115123",
        imageurl: "Developers/Vishnutheep.jpg"),
  ];
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: (width > 800) ? width * 0.4 : width * 0.6,
            height: height * 0.6,
            child: Column(
              children: [
                Container(
                  width: (width > 800) ? width * 0.4 * 0.9 : width * 0.6 * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (width > 800)
                            ? width * 0.4 * 0.9 * 0.6
                            : width * 0.6 * 0.6,
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.002),
                        child: const Text(
                          "Designed and Developed by",
                          style:
                              TextStyle(fontFamily: 'InterBold', fontSize: 15),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: width * 0.8,
                  height: height * 0.5,
                  child: ListView(
                    children: [
                      Center(
                        child: Wrap(
                          spacing: 30,
                          runSpacing: 50,
                          alignment: WrapAlignment.start,
                          children: [
                            for (int i = 0; i < devlist.length; i++)
                              profile(devlist, i)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

// ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: devlist.length,
//                         itemBuilder: (context, index) {
//                           return Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Stack(
//                                     overflow: Overflow.visible,
//                                     alignment: AlignmentDirectional.center,
//                                     children: [
//                                       Container(
//                                         width: 200,
//                                         height: 200,
//                                         decoration: BoxDecoration(
//                                             // color: light != null
//                                             //     ? light.toColor()
//                                             //     : Color.fromRGBO(
//                                             //         229, 229, 229, 1),
//                                             borderRadius:
//                                                 BorderRadius.circular(360)),
//                                       ),
//                                       Positioned(
//                                         width: 250,
//                                         height: 250,
//                                         // top: 10,
//                                         bottom: 10,
//                                         child: Center(
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(360),
//                                             child: InkWell(
//                                                 // onTap: () {
//                                                 //   setState(() {
//                                                 //     isSelect = !isSelect;
//                                                 //   });
//                                                 // },
//                                                 child: Image(
//                                                     image: AssetImage(
//                                                         devlist[index]
//                                                             .imageurl))),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(devlist[index].name,
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold)),
//                                   SizedBox(height: 5),
//                                   Text(devlist[index].role,
//                                       style: TextStyle(fontSize: 12))
//                                 ],
//                               ),
//                               SizedBox(width: 15),
//                             ],
//                           );
//                         }),