import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:istasite/Homepage/Developers.dart';
import 'package:istasite/InterviewExperience/InterviewExperience.dart';
import 'package:istasite/LoginDemo.dart';
import 'package:istasite/Magazine/Magazine.dart';
import 'package:istasite/Projects/Projects.dart';
import 'package:istasite/login.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Components/classes.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = "";
  final itemKey = GlobalKey();
  bool isSelect = false;
  PaletteColor imgbackground = PaletteColor(Colors.red, 4);
  HSLColor light = HSLColor.fromColor(Colors.black),
      dark = HSLColor.fromColor(Colors.black);

  List<OfficeBearer> oblist = [];

  List<Magazine> magazinelist = [];
  //   Magazine(
  //       id: 1, month: "January", year: 2022, url: "assets/FirstMagazine.png"),
  //   Magazine(
  //       id: 2, month: "February", year: 2022, url: "assets/FirstMagazine.png"),
  //   Magazine(
  //       id: 3, month: "March", year: 2022, url: "assets/FirstMagazine.png"),
  //   Magazine(
  //       id: 4, month: "April", year: 2022, url: "assets/FirstMagazine.png"),
  //   Magazine(id: 5, month: "May", year: 2022, url: "assets/FirstMagazine.png")
  // ];
  Map<String, int> months = {
    "January": 1,
    "February": 2,
    "March": 3,
    "April": 4,
    "May": 5,
    "June": 6,
    "July": 7,
    "August": 8,
    "September": 9,
    "October": 10,
    "November": 11,
    "December": 12
  };

  void initState() {
    super.initState();
    _findBackground();
    fetchOBList();
    fetchMagazineList();
    magazinelist.sort((a, b) => b.edition.compareTo(a.edition));
  }

  void fetchOBList() async {
    List<OfficeBearer> officebearers = [];
    SharedPreferences session = await SharedPreferences.getInstance();

    await FirebaseFirestore.instance
        .collection("OfficeBearers")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        for (int i = 0; i < element.data()['OBlist'].length; i++) {
          officebearers.add(OfficeBearer(
              id: element.data()['OBlist'][i]['id'],
              name: element.data()['OBlist'][i]['name'],
              role: element.data()['OBlist'][i]['role'],
              contact: element.data()['OBlist'][i]['contact'],
              imgurl: element.data()['OBlist'][i]['imgurl'],
              light: HSLColor.fromColor(Colors.black),
              dark: HSLColor.fromColor(Colors.black)));
        }
      });
      setState(() {
        oblist = officebearers;
        name = session.getString("name")!;
      });
    });
  }

  void fetchMagazineList() async {
    List<Magazine> magazines = [];
    await FirebaseFirestore.instance
        .collection("Magazine")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        magazines.add(Magazine(
            id: element.data()['id'],
            edition: element.data()['edition'],
            month: element.data()['month'],
            year: element.data()['year'],
            cover_url: element.data()['cover_url'],
            file_url: element.data()['file_url']));
      });
      setState(() {
        magazinelist = magazines;
        magazinelist.sort((a, b) => b.edition.compareTo(a.edition));
      });
    });
  }

  _findBackground() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage("assets/Union.png"),
      size: Size(1000000000, 10000000000),
    );
    imgbackground = generator.dominantColor != null
        ? generator.dominantColor!
        : PaletteColor(Colors.white, 2);
    HSLColor productHSL = HSLColor.fromColor(imgbackground.color);
    light = productHSL.withLightness(0.8);
    dark = productHSL.withLightness(0.3);
    setState(() {});
  }

  Future ScrolltoItem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(context);
  }

  Widget title(double width, double height) {
    return (width > 1000)
        ? Row(
            children: [
              Container(
                width: width * 0.5,
                height: height,
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.5 * 0.15,
                      vertical: height * 0.5 * 0.2),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Center(child: Text("Horse"))),
                ),
              ),
              Container(
                width: width * 0.5,
                padding: EdgeInsets.symmetric(horizontal: width * 0.5 * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/ISTAlogo.png"),
                      width: 250,
                    ),
                    Text(
                      "INFORMATION SCIENCE AND TECHNOLOGY ASSOCIATION",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                        "The red line moved across the page. With each millimeter it advanced forward, something changed in the room.",
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        print("Hello");
                        ScrolltoItem();
                      },
                      child: Container(
                        width: width * 0.5 * 0.22,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_circle_down_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Explore more",
                                style: TextStyle(color: Colors.white),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              Container(
                width: width,
                height: height,
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.15, vertical: height * 0.2),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Center(child: Text("Horse"))),
                ),
              ),
              Container(
                width: width,
                height: height * 0.75,
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage("assets/ISTAlogo.png"),
                      width: 250,
                    ),
                    Text(
                      "INFORMATION SCIENCE AND TECHNOLOGY ASSOCIATION",
                      style: TextStyle(
                          fontSize: (width > 600) ? 35 : 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                        "The red line moved across the page. With each millimeter it advanced forward, something changed in the room.",
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        print("Hello");
                      },
                      child: Container(
                        width: (width > 600) ? width * 0.22 : width * 0.42,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.arrow_circle_down_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Explore more",
                                style: TextStyle(color: Colors.white),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
  }

  Widget magazine(double width, double height) {
    return Container(
      key: itemKey,
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            width: width * 0.8,
            height: (height > 400) ? height * 0.55 : height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(113, 165, 188, 0.98),
            ),
            child: (magazinelist.isEmpty)
                ? Center(child: CircularProgressIndicator())
                : InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MagazinePage(
                                  file_url: magazinelist[0].file_url)));
                    },
                    child: Image(image: AssetImage(magazinelist[0].cover_url))),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CACHE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Previous Editions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              (magazinelist.isEmpty)
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      width: width * 0.8,
                      height: height * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: magazinelist.length - 1,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MagazinePage(
                                                            file_url:
                                                                magazinelist[
                                                                        index +
                                                                            1]
                                                                    .file_url)));
                                          },
                                          child: Image(
                                            image: AssetImage(
                                                magazinelist[index + 1]
                                                    .cover_url),
                                            height: height * 0.3 * 0.6,
                                          ),
                                        ),
                                      ),
                                      Text(
                                          "Edition ${magazinelist[index + 1].edition}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          "${magazinelist[index + 1].month}  ${magazinelist[index + 1].year}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            );
                          }),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget project(double width, double height) {
    return Stack(children: [
      Center(
        child: Container(
          width: width * 0.9,
          // height: height * 0.9,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: InkWell(
                  onTap: () {
                    if (name != "")
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Projects()));
                    else
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child:
                      Image(image: AssetImage("assets/MainProjectScreen.png"))),
            ),
          ),
        ),
      )
      // (imgsize != null)
      //     ? Center(
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(60),
      //           child: Container(
      //             width: imgsize.width,
      //             height: imgsize.height,
      //             decoration: BoxDecoration(
      //                 gradient: LinearGradient(
      //                     begin: Alignment.topCenter,
      //                     end: Alignment.bottomCenter,
      //                     colors: [
      //                   Color.fromRGBO(0, 0, 0, 0),
      //                   Color.fromRGBO(0, 0, 0, 0.5),
      //                   Color.fromRGBO(0, 0, 0, 0.5),
      //                   Color.fromRGBO(0, 0, 0, 0.9),
      //                 ])),
      //           ),
      //         ),
      //       )
      //     : Container(),
      // (imgsize != null)
      //     ? Center(
      //         child: Container(
      //             padding: EdgeInsets.only(right: 50, bottom: 20),
      //             alignment: Alignment.bottomRight,
      //             width: imgsize.width,
      //             height: imgsize.height,
      //             child: InkWell(
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) =>
      //                             MyHomePage(title: "Dashboard")));
      //               },
      //               child: Container(
      //                 padding: EdgeInsets.only(right: 50, bottom: 20),
      //                 width: imgsize.width * 0.3,
      //                 height: imgsize.height * 0.2,
      //                 color: Colors.red,
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   crossAxisAlignment: CrossAxisAlignment.end,
      //                   children: [
      //                     Text(
      //                       "PROJECTS",
      //                       style: TextStyle(
      //                           fontSize: (width > 600) ? 23 : 18,
      //                           color: Colors.black),
      //                     ),
      //                     SizedBox(height: 5),
      //                     Text(
      //                       "Explore All -->",
      //                       style: TextStyle(
      //                           fontSize: (width > 600) ? 18 : 12,
      //                           color: Colors.black),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             )),
      //       )
      //     : Container()
    ]);
  }

  Widget interview(double width, double height) {
    return (width > 1000)
        ? Row(
            children: [
              Container(
                width: width * 0.5,
                height: height,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.5 * 0.15,
                      vertical: height * 0.5 * 0.2),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: Center(
                          child: Text("Horse",
                              style: TextStyle(color: Colors.black)))),
                ),
              ),
              Container(
                width: width * 0.5,
                padding: EdgeInsets.symmetric(horizontal: width * 0.5 * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Interview Experience",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Know about your interview beforehand.",
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Know about your interview beforehand.",
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Know about your interview beforehand.",
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InterviewExperience()));
                      },
                      child: Container(
                        width: width * 0.5 * 0.22,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Explore All -->",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              Container(
                width: width,
                height: height,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.15, vertical: height * 0.2),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: Center(
                          child: Text("Horse",
                              style: TextStyle(color: Colors.white)))),
                ),
              ),
              Container(
                width: width,
                height: height * 0.4,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Interview Experience",
                      style: TextStyle(
                          fontSize: (width > 600) ? 35 : 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Know about your interview beforehand.",
                            style: TextStyle(
                                fontSize: (width > 600)
                                    ? 18
                                    : (width > 400)
                                        ? 15
                                        : 12)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Know about your interview beforehand.",
                            style: TextStyle(
                                fontSize: (width > 600)
                                    ? 18
                                    : (width > 400)
                                        ? 15
                                        : 12)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.abc),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Know about your interview beforehand.",
                            style: TextStyle(
                                fontSize: (width > 600)
                                    ? 18
                                    : (width > 400)
                                        ? 15
                                        : 12)),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InterviewExperience()));
                      },
                      child: Container(
                        width: (width > 600) ? width * 0.22 : width * 0.42,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "Explore All -->",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }

  Widget team(double width, double height, Size size) {
    return Center(
      child: (oblist.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.only(top: 50),
              width: width * 0.9,
              height: height * 0.95,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                        padding: EdgeInsets.only(right: 40),
                        child: Text("TEAM", style: TextStyle(fontSize: 20))),
                  ]),
                  // SizedBox(height: height * 0.05),
                  (width > 800)
                      ? Container(
                          width: width * 0.8,
                          height: height * 0.4,
                          child: Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            overflow: Overflow.visible,
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              (isSelect)
                                                  ? Container(
                                                      width: 210,
                                                      height: 210,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      360),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0xff959595),
                                                                Color(
                                                                    0xff000000)
                                                              ])),
                                                    )
                                                  : Container(),
                                              Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                    color: light != null
                                                        ? light.toColor()
                                                        : Color.fromRGBO(
                                                            229, 229, 229, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            360)),
                                              ),
                                              Positioned(
                                                width: 250,
                                                height: 250,
                                                // top: 10,
                                                bottom: 10,
                                                child: Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            360),
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isSelect =
                                                                !isSelect;
                                                          });
                                                        },
                                                        child: Image(
                                                            image: AssetImage(
                                                                oblist[index]
                                                                    .imgurl))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(oblist[index].name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5),
                                          Text(oblist[index].role,
                                              style: TextStyle(fontSize: 12))
                                        ],
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  );
                                }),
                          ),
                        )
                      : Container(),
                  //SizedBox(height: 20),
                  (width > 800)
                      ? Container(
                          width: width * 0.8,
                          height: height * 0.45,
                          child: Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: oblist.length - 2,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            overflow: Overflow.visible,
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              (isSelect)
                                                  ? Container(
                                                      width: 210,
                                                      height: 210,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      360),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0xff959595),
                                                                Color(
                                                                    0xff000000)
                                                              ])),
                                                    )
                                                  : Container(),
                                              Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                    color: light != null
                                                        ? light.toColor()
                                                        : Color.fromRGBO(
                                                            229, 229, 229, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            360)),
                                              ),
                                              Positioned(
                                                width: 250,
                                                height: 250,
                                                // top: 10,
                                                bottom: 10,
                                                child: Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            360),
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isSelect =
                                                                !isSelect;
                                                          });
                                                        },
                                                        child: Image(
                                                            image: AssetImage(
                                                                oblist[index]
                                                                    .imgurl))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(oblist[index + 2].name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5),
                                          Text(oblist[index + 2].role,
                                              style: TextStyle(fontSize: 12))
                                        ],
                                      ),
                                      SizedBox(width: 15),
                                    ],
                                  );
                                }),
                          ),
                        )
                      : Container(
                          width: width * 0.8,
                          height: height * 0.8,
                          child: Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: oblist.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 50),
                                      Stack(
                                        overflow: Overflow.visible,
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          (isSelect)
                                              ? Container(
                                                  width: 210,
                                                  height: 210,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              360),
                                                      gradient: LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Color(0xff959595),
                                                            Color(0xff000000)
                                                          ])),
                                                )
                                              : Container(),
                                          Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: light != null
                                                    ? light.toColor()
                                                    : Color.fromRGBO(
                                                        229, 229, 229, 1),
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
                                                    onTap: () {
                                                      setState(() {
                                                        isSelect = !isSelect;
                                                      });
                                                    },
                                                    child: Image(
                                                        image: AssetImage(
                                                            oblist[index]
                                                                .imgurl))),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(oblist[index].name,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 5),
                                      Text(oblist[index].role,
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  );
                                }),
                          ),
                        ),
                ],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            title(width, height),
            SizedBox(height: 20),
            magazine(width, height),
            // SizedBox(height: 10),
            project(width, height),
            interview(width, height),
            team(width, height, size),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                  child: Text("Designers and Developers"),
                  onPressed: () {
                    developersDialogBox(context, width, height);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
