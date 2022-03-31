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

Future developersDialogBox(BuildContext context, double width, double height) {
  List<Developer> devlist = [
    Developer(
        name: "Akil Vishnu M",
        role: "Designer",
        rollno: "2018115010",
        imageurl: "assets/Union.png"),
    Developer(
        name: "Akil Vishnu M",
        role: "Designer",
        rollno: "2018115010",
        imageurl: "assets/Union.png"),
    Developer(
        name: "Akil Vishnu M",
        role: "Designer",
        rollno: "2018115010",
        imageurl: "assets/Union.png"),
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
                          icon: Icon(Icons.close))
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: width * 0.8,
                  height: height * 0.5,
                  child: Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: devlist.length,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    overflow: Overflow.visible,
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            // color: light != null
                                            //     ? light.toColor()
                                            //     : Color.fromRGBO(
                                            //         229, 229, 229, 1),
                                            borderRadius:
                                                BorderRadius.circular(360)),
                                      ),
                                      Positioned(
                                        width: 250,
                                        height: 250,
                                        // top: 10,
                                        bottom: 10,
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(360),
                                            child: InkWell(
                                                // onTap: () {
                                                //   setState(() {
                                                //     isSelect = !isSelect;
                                                //   });
                                                // },
                                                child: Image(
                                                    image: AssetImage(
                                                        devlist[index]
                                                            .imageurl))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(devlist[index].name,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 5),
                                  Text(devlist[index].role,
                                      style: TextStyle(fontSize: 12))
                                ],
                              ),
                              SizedBox(width: 15),
                            ],
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
