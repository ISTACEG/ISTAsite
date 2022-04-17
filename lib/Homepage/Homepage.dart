import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:istasite/Homepage/Developers.dart';
import 'package:istasite/InterviewExperience/InterviewExperience.dart';
import 'package:istasite/InterviewExperience/InterviewExpPage1.dart';
import 'package:istasite/Projects/Projects.dart';
import 'package:istasite/login.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Components/classes.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String name = "";
  final itemKey = GlobalKey();
  PaletteColor imgbackground = PaletteColor(Colors.red, 4);
  HSLColor light = HSLColor.fromColor(Colors.black),
      dark = HSLColor.fromColor(Colors.black);
  List<bool> isSelect = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<OfficeBearer> oblist = [
    OfficeBearer(
        id: 1,
        name: "Dr.S.Swamynathan",
        role: "President",
        imgurl: "assets/OB/Swamynathan.jpg",
        contact: ""),
    OfficeBearer(
        id: 2,
        name: "Dr.N.Thangaraj",
        role: "Staff Treasurer",
        imgurl: "assets/OB/Thangaraj.jpg",
        contact: "https://www.linkedin.com/in/thangaraj-n-17570027/"),
    OfficeBearer(
        id: 3,
        name: "Adhis H",
        role: "Chairman",
        imgurl: "assets/OB/Adhis.jpg",
        contact: "https://www.linkedin.com/in/adhis-hariharadas-9b90b7184"),
    OfficeBearer(
        id: 4,
        name: "Ragul B",
        role: "Student Treasurer",
        imgurl: "assets/OB/Ragul.jpg",
        contact: "https://www.linkedin.com/mwlite/in/ragul-babu-130356191"),
    OfficeBearer(
        id: 5,
        name: "Balasubramaniam M",
        role: "Overall Coordinator",
        imgurl: "assets/OB/Bala.jpg",
        contact: "https://www.linkedin.com/in/balasubramaniam-m-605ab1201/"),
    OfficeBearer(
        id: 6,
        name: "Lavanya S",
        role: "Web Development & Design Head",
        imgurl: "assets/OB/Lavanya.jpg",
        contact: "https://www.linkedin.com/in/lavanya-s-02ab20199"),
    OfficeBearer(
        id: 7,
        name: "Murugan A",
        role: "Web Development & Design Head",
        imgurl: "assets/OB/Murugan.jpg",
        contact: "https://www.linkedin.com/in/murugan2000/"),
    OfficeBearer(
        id: 8,
        name: "Hariharan S",
        role: "Programming Head",
        imgurl: "assets/OB/Hariharan.png",
        contact: "https://www.linkedin.com/in/hariharan-srinivasan-32b140195"),
    OfficeBearer(
        id: 9,
        name: "Hrithik K",
        role: "Programming Head",
        imgurl: "assets/OB/Hrithik.jpg",
        contact:
            "https://www.linkedin.com/mwlite/in/hrithik-karthikeyan-5440601a8"),
    OfficeBearer(
        id: 10,
        name: "Shankar Subramanian",
        role: "News Letter Head",
        imgurl: "assets/OB/Shankar.JPG",
        contact: "https://www.linkedin.com/in/shankars99/"),
    OfficeBearer(
        id: 11,
        name: "Kevin Paul",
        role: "Documentation Head",
        imgurl: "assets/OB/Kevin.jpg",
        contact: "https://www.linkedin.com/in/thekevinpaul/"),
    OfficeBearer(
        id: 12,
        name: "Venkat Karthick P",
        role: "Placement Training Coordinator",
        imgurl: "assets/OB/Venkat.jpg",
        contact: "https://www.linkedin.com/in/venkat-karthick-4a5101200"),
    OfficeBearer(
        id: 13,
        name: "Sushrut Vinayak K",
        role: "Internship Training Coordinator",
        imgurl: "assets/OB/Sushrut.jpg",
        contact: "https://www.linkedin.com/in/sushrut-vinayak-7323041b5/"),
    OfficeBearer(
        id: 14,
        name: "Nauvyashree Anbarasan",
        role: "Marketing Head",
        imgurl: "assets/OB/Nauvyashree.jpg",
        contact: "https://linktr.ee/Nauvya"),
    OfficeBearer(
        id: 15,
        name: "Dhrisha G",
        role: "Industrial Relations",
        imgurl: "assets/OB/Dhrisha.jpg",
        contact: "https://in.linkedin.com/in/dhrisha-ganesan-08953a186"),
    OfficeBearer(
        id: 16,
        name: "Raghav Swaminathan",
        role: "Industrial Relations",
        imgurl: "assets/OB/Raghav.jpg",
        contact: "https://www.linkedin.com/in/raghav-swaminathan-9714b0192"),
    OfficeBearer(
        id: 17,
        name: "Jeevesh Guha Natrajan",
        role: "Co-Chairman",
        imgurl: "assets/OB/Jeevesh.JPG",
        contact: "https://instagram.com/jeevguha?r=nametag"),
    OfficeBearer(
        id: 18,
        name: "Praveen R",
        role: "General Secretary",
        imgurl: "assets/OB/Praveen.png",
        contact: "https://www.linkedin.com/mwlite/in/praveen-ramesh-007919214"),
    OfficeBearer(
        id: 19,
        name: "Dhanya Venkateswaran",
        role: "Deputy Secretary",
        imgurl: "assets/OB/Dhanya.jpg",
        contact: "https://www.linkedin.com/in/dhanya-venkateswaran-1559b5188/"),
  ];

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
    fetchMagazineList();
    magazinelist.sort((a, b) => b.edition.compareTo(a.edition));
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
                        // color: Colors.white,
                      ),
                      child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset("assets/department_home.jpg")),
                      )
                      // Center(child: Text("Horse"))
                      ),
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
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    SizedBox(height: 20),
                    Text(
                        "-> Enjoy reading \"CACHE\", the monthly magazine of DIST.\n\n-> Have detailed ideas from previous prjects.\n\n-> Dive deep into the interview experiences and know your interview beforehand.",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'InterLight'),
                        textAlign: TextAlign.justify),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'InterBold'),
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
                // height: height,
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.15, vertical: height * 0.2),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        //color: Colors.white,
                      ),
                      child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset("assets/department_home.jpg")),
                      )
                      //  Center(child: Text("Horse"))
                      ),
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
                    const Image(
                      image: AssetImage("assets/ISTAlogo.png"),
                      width: 250,
                    ),
                    Text(
                      "INFORMATION SCIENCE AND TECHNOLOGY ASSOCIATION",
                      style: TextStyle(
                          fontSize: (width > 600) ? 35 : 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'InterBold'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        "-> Enjoy reading \"CACHE\", the monthly magazine of DIST.\n\n-> Have detailed ideas from previous prjects.\n\n-> Dive deep into the interview experiences and know your interview beforehand.",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'InterLight'),
                        textAlign: TextAlign.justify),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        ScrolltoItem();
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'InterBold'),
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
                    onTap: () async {
                      await launch(magazinelist[0].file_url);
                    },
                    child: Image(image: AssetImage(magazinelist[0].cover_url))),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CACHE",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold')),
              Text("Previous Editions",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold')),
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
                                          onTap: () async {
                                            await launch(magazinelist[index + 1]
                                                .file_url);
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
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'InterBold')),
                                      Text(
                                          "${magazinelist[index + 1].month}  ${magazinelist[index + 1].year}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'InterBold')),
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
    return Column(
      children: [
        (width < 600)
            ? InkWell(
                onTap: () {
                  if (name != "")
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Projects()));
                  else
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Projects ->",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "InterBold")))
            : Container(),
        Stack(children: [
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Projects()));
                        else
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                      },
                      child: Image(
                          image: AssetImage("assets/MainProjectScreen.png"))),
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
        ]),
      ],
    );
  }

  Widget interview(double width, double height) {
    return (width > 1000)
        ? Center(
            child: Container(
            width: width,
            height: height * 0.5,
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Interview Experience",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Know about your interview beforehand.",
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'InterBold')),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Learn some tips from previous experiences",
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'InterBold')),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Learn how to be professional",
                        style:
                            TextStyle(fontSize: 18, fontFamily: 'InterBold')),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Interview()));
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
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'InterBold'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        : Container(
            width: width,
            height: height * 0.4,
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Interview Experience",
                  style: TextStyle(
                      fontSize: (width > 600) ? 35 : 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'InterBold'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Know about your interview beforehand.",
                        style: TextStyle(
                            fontSize: (width > 600)
                                ? 18
                                : (width > 400)
                                    ? 15
                                    : 12,
                            fontFamily: 'InterBold')),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Know about your interview beforehand.",
                        style: TextStyle(
                            fontSize: (width > 600)
                                ? 18
                                : (width > 400)
                                    ? 15
                                    : 12,
                            fontFamily: 'InterBold')),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Know about your interview beforehand.",
                        style: TextStyle(
                            fontSize: (width > 600)
                                ? 18
                                : (width > 400)
                                    ? 15
                                    : 12,
                            fontFamily: 'InterBold')),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Interview()));
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
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'InterBold'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                        child: Text("TEAM",
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'InterBold'))),
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
                                              (isSelect[index])
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
                                                child: Center(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            360),
                                                    child: InkWell(
                                                        onTap: () async {
                                                          setState(() {
                                                            for (int j = 0;
                                                                j <
                                                                    isSelect
                                                                        .length;
                                                                j++)
                                                              isSelect[j] =
                                                                  false;
                                                            isSelect[index] =
                                                                true;
                                                          });
                                                          await launch(
                                                              oblist[index]
                                                                  .contact);
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
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'InterBold')),
                                          SizedBox(height: 5),
                                          Text(oblist[index].role,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterLight'))
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
                          height: height * 0.4,
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
                                              (isSelect[index + 2])
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
                                              InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    for (int j = 0;
                                                        j < isSelect.length;
                                                        j++)
                                                      isSelect[j] = false;
                                                    isSelect[index + 2] = true;
                                                  });
                                                  await launch(oblist[index + 2]
                                                      .contact);
                                                },
                                                child: Container(
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
                                                  child: Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              360),
                                                      child: Image(
                                                          image: AssetImage(
                                                              oblist[index + 2]
                                                                  .imgurl)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(oblist[index + 2].name,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'InterBold')),
                                          SizedBox(height: 5),
                                          Text(oblist[index + 2].role,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterLight'))
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
                                          (isSelect[index])
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
                                            child: Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(360),
                                                child: InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        for (int j = 0;
                                                            j < isSelect.length;
                                                            j++)
                                                          isSelect[j] = false;
                                                        isSelect[index] = true;
                                                      });
                                                      await launch(oblist[index]
                                                          .contact);
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
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'InterBold')),
                                      SizedBox(height: 5),
                                      Text(oblist[index].role,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterLight')),
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
            Container(
              width: width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Center(
                child: TextButton(
                    child: Text("Designers and Developers",
                        style: TextStyle(fontFamily: 'InterBold')),
                    onPressed: () {
                      developersDialogBox(context, width, height);
                    }),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



// Stack(
//                                             overflow: Overflow.visible,
//                                             alignment:
//                                                 AlignmentDirectional.center,
//                                             children: [
//                                               (isSelect)
//                                                   ? Container(
//                                                       width: 210,
//                                                       height: 210,
//                                                       decoration: BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       360),
//                                                           gradient: LinearGradient(
//                                                               begin: Alignment
//                                                                   .topCenter,
//                                                               end: Alignment
//                                                                   .bottomCenter,
//                                                               colors: [
//                                                                 Color(
//                                                                     0xff959595),
//                                                                 Color(
//                                                                     0xff000000)
//                                                               ])),
//                                                     )
//                                                   : Container(),
//                                               Container(
//                                                 width: 200,
//                                                 height: 200,
//                                                 decoration: BoxDecoration(
//                                                     color: light != null
//                                                         ? light.toColor()
//                                                         : Color.fromRGBO(
//                                                             229, 229, 229, 1),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             360)),
//                                               ),
//                                               Positioned(
//                                                 width: 250,
//                                                 height: 250,
//                                                 // top: 10,
//                                                 bottom: 10,
//                                                 child: Center(
//                                                   child: ClipRRect(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             360),
//                                                     child: InkWell(
//                                                         onTap: () {
//                                                           setState(() {
//                                                             isSelect =
//                                                                 !isSelect;
//                                                           });
//                                                         },
//                                                         child: Image(
//                                                             image: AssetImage(
//                                                                 oblist[index]
//                                                                     .imgurl))),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
                                         






                                         //interview exp image
                                         // Container(
              //   width: width * 0.5,
              //   height: height,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: width * 0.5 * 0.15,
              //         vertical: height * 0.5 * 0.2),
              //     child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(30),
              //           color: Colors.black,
              //         ),
              //         child: Center(
              //             child: Text("Horse",
              //                 style: TextStyle(color: Colors.black)))),
              //   ),
              // ),