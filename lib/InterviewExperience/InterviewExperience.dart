import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:istasite/Components/classes.dart';
import 'package:url_launcher/url_launcher.dart';

var timecir = Container(
  width: 17,
  height: 17,
  decoration: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0))),
);
var smallcir = Container(
  width: 5,
  height: 5,
  decoration: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0))),
);
var line = Container(
    height: 30,
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(width: 2.0, color: Color(0xFFb3b3b3)),
        left: BorderSide(width: 1.5, color: Color(0xFFb3b3b3)),
        right: BorderSide(width: 1.5, color: Color(0xFFb3b3b3)),
        bottom: BorderSide(width: 2.0, color: Color(0xFFb3b3b3)),
      ),
    ));
var timeline = Container(
    height: 133,
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(width: 2.0, color: Color(0xFFb3b3b3)),
        left: BorderSide(width: 1.5, color: Color(0xFFb3b3b3)),
        right: BorderSide(width: 1.5, color: Color(0xFFb3b3b3)),
        bottom: BorderSide(width: 2.0, color: Color(0xFFb3b3b3)),
      ),
    ));

class Bodycontent extends StatelessWidget {
  Map data;
  List years;
  Bodycontent({Key? key, required this.data, required this.years})
      : super(key: key);

  Widget year(int year, int count) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
        child: Row(
          children: [
            Text(
              "${year}",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'InterBold',
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            smallcir,
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Text(
                "${count} Articles",
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'InterBold',
                    color: Colors.black54),
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: screenwidth > 425
          ? const EdgeInsets.fromLTRB(50, 50, 20, 20)
          : const EdgeInsets.fromLTRB(30, 50, 20, 20),
      child: Column(children: [
        for (int y = 0; y < years.length; y++)
          Row(
            children: [
              Column(children: [
                timecir,
                line,
                for (var i = 0; i < data[years[y]].length; i++) timeline
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                year(years[y], data[years[y]].length),
                for (var i = 0; i < data[years[y]].length; i++)
                  MyCardWidget(data: data[years[y]][i])
              ])
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        // Row(
        //   children: [
        //     Column(children: [
        //       timecir,
        //       line,
        //       for (var i = 0; i < 1; i++) timeline
        //     ]),
        //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       year(2022),
        //       for (var i = 0; i < 1; i++) MyCardWidget()
        //     ])
        //   ],
        //   crossAxisAlignment: CrossAxisAlignment.start,
        // ),
        // Row(
        //   children: [
        //     Column(children: [
        //       timecir,
        //       line,
        //       for (var i = 0; i < 2; i++) timeline
        //     ]),
        //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       year(2022),
        //       for (var i = 0; i < 2; i++) MyCardWidget()
        //     ])
        //   ],
        //   crossAxisAlignment: CrossAxisAlignment.start,
        // ),
      ]),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  Experience data;
  MyCardWidget({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Center(
        child: Container(
      width: screenwidth > 630 ? screenwidth * 0.5 : screenwidth - 90,
      height: 130,
      padding: screenwidth > 425
          ? EdgeInsets.fromLTRB(15, 0, 0, 20)
          : EdgeInsets.fromLTRB(5, 0, 0, 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: new BorderSide(color: Color(0xffc4c4c4), width: 1.0),
        ),
        color: Color(0xffededed),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () async {
                await launch(data.experience);
              },
              child: ListTile(
                leading: Container(
                  //constraints: const BoxConstraints(minWidth: 70.0, maxWidth: 80),
                  constraints: screenwidth > 425
                      ? const BoxConstraints(minWidth: 70.0, maxWidth: 80)
                      : const BoxConstraints(maxWidth: 50),
                  //height: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/download.png')),
                  ),
                ),
                title: Text(data.studentName,
                    style: TextStyle(
                        fontSize: screenwidth > 425 ? 20 : 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InterBold')),
                subtitle: Text(data.rollno,
                    style: TextStyle(
                        fontSize: screenwidth > 425 ? 17 : 13,
                        color: Colors.black,
                        fontFamily: 'InterBold')),

                trailing: Transform.rotate(
                  angle: 180 * pi / 180, //set the angel
                  child: const Icon(
                    Icons.keyboard_backspace,
                    size: 30,
                    color: Colors.black,
                  ),
                ),

                //trailing:IconButton(icon: Icon(Icons.keyboard_backspace , size: 36),onPressed:(){},)
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Header extends StatelessWidget {
  String name, img;
  Header({Key? key, required this.name, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
        child: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          height: 250,
          child: Stack(children: <Widget>[
            Positioned.fill(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: Colors.transparent))),
            Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(bottom: 10, left: 50),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'InterBold',
                    fontSize: screenwidth > 450 ? 60.0 : 30.0,
                  ),
                  textAlign: TextAlign.left,
                ))
          ])),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment(0.85, 0.7),
                child: Padding(
                    padding: screenwidth > 450
                        ? EdgeInsets.only(top: 120.0)
                        : EdgeInsets.only(top: 150.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(128, 128, 128, 0.7)),
                        height: screenwidth > 450 ? 180 : 130,
                        width: screenwidth > 450 ? 180 : 130,
                        padding: const EdgeInsets.only(
                            top: 25, right: 25, bottom: 25, left: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(img),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        )))),
          ])
    ]));
  }
}

class InterviewExperience extends StatefulWidget {
  final Company company;
  const InterviewExperience({Key? key, required this.company})
      : super(key: key);

  @override
  _InterviewExperienceState createState() => _InterviewExperienceState();
}

class _InterviewExperienceState extends State<InterviewExperience> {
  List<Experience> experiences = [];
  Map freqOfExp = {};
  List years = [];

  void initState() {
    super.initState();
    fetchExperiences();
  }

  void fetchExperiences() async {
    List<Experience> experiences_db = [];
    await FirebaseFirestore.instance
        .collection("InterviewExperience")
        .doc(widget.company.docid)
        .collection("Students")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        experiences_db.add(Experience(
            studentName: element.data()['studentName'],
            rollno: element.data()['rollno'],
            experience: element.data()['experience'],
            yearOfPassing: element.data()['yearOfPassing']));
      });
      setState(() {
        experiences = experiences_db;
      });
    });
    setState(() {
      // experiences.sort((Experience a, Experience b) =>
      //     b.yearOfPassing.compareTo(a.yearOfPassing));
      for (int i = 0; i < experiences.length; i++) {
        if (freqOfExp.containsKey(experiences[i].yearOfPassing)) {
          freqOfExp[experiences[i].yearOfPassing]?.add(experiences[i]);
        } else {
          freqOfExp[experiences[i].yearOfPassing] = [experiences[i]];
        }
      }
      years = freqOfExp.keys.toList();
      years.sort((a, b) => b.compareTo(a));
    });
  }

  @override
  Widget build(BuildContext context) {
    //var screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[50],
          body: SingleChildScrollView(
            child: Column(children: [
              Header(name: widget.company.name, img: widget.company.img),
              Bodycontent(data: freqOfExp, years: years),
            ]),
          )),
    );
  }
}
