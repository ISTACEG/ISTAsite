import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';

String func(String s1) {
  return s1 + " Articles";
}

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
var year = Container(
    padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
    child: Row(
      children: [
        const Text(
          "2021",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Newfont1',
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
        MyArticle()
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    ));

class Bodycontent extends StatelessWidget {
  const Bodycontent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: screenwidth > 425
          ? const EdgeInsets.fromLTRB(50, 50, 20, 20)
          : const EdgeInsets.fromLTRB(30, 50, 20, 20),
      child: Column(children: [
        Row(
          children: [
            Column(children: [
              timecir,
              line,
              for (var i = 0; i < 3; i++) timeline
            ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [year, for (var i = 0; i < 3; i++) MyCardWidget()])
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        Row(
          children: [
            Column(children: [
              timecir,
              line,
              for (var i = 0; i < 1; i++) timeline
            ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [year, for (var i = 0; i < 1; i++) MyCardWidget()])
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        Row(
          children: [
            Column(children: [
              timecir,
              line,
              for (var i = 0; i < 2; i++) timeline
            ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [year, for (var i = 0; i < 2; i++) MyCardWidget()])
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ]),
    );
  }
}

class MyArticle extends StatelessWidget {
  final String x = func("10");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Text(
        ' $x',
        style: const TextStyle(
            fontSize: 14, fontFamily: 'Newfont1', color: Colors.black54),
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {
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
            ListTile(
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
                      child: Image.asset('download.png')),
                ),
              ),
              title: Text('Rachel Green',
                  style: TextStyle(
                      fontSize: screenwidth > 425 ? 20 : 15,
                      fontWeight: FontWeight.bold)),
              subtitle: Text('2018105065',
                  style: TextStyle(
                      fontSize: screenwidth > 425 ? 17 : 13,
                      color: Colors.black)),

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
          ],
        ),
      ),
    ));
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
        child: Stack(children: <Widget>[
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('../assets/background.png'),
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
                  'Netflix',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Arial",
                    fontSize: screenwidth > 450 ? 60.0 : 40.0,
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
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('../assets/netflixhead.png'),
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
  const InterviewExperience({Key? key}) : super(key: key);

  @override
  _InterviewExperienceState createState() => _InterviewExperienceState();
}

class _InterviewExperienceState extends State<InterviewExperience> {
  @override
  Widget build(BuildContext context) {
    //var screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[50],
          body: SingleChildScrollView(
            child: Column(children: const [
              Header(),
              Bodycontent(),
            ]),
          )),
    );
  }
}
