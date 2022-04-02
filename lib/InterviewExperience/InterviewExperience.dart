/*import 'package:flutter/material.dart';

class InterviewExperience extends StatefulWidget {
  const InterviewExperience({Key? key}) : super(key: key);

  @override
  _InterviewExperienceState createState() => _InterviewExperienceState();
}

class _InterviewExperienceState extends State<InterviewExperience> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Interview Experience")));
  }
}*/
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

var i = 0;
const List colors = [
  Color.fromARGB(255, 34, 87, 74),
  Color.fromARGB(255, 221, 174, 140),
  Color.fromARGB(255, 156, 62, 54),
  Color.fromARGB(255, 255, 161, 132),
  Color.fromARGB(255, 47, 177, 254),
  Color.fromARGB(255, 54, 156, 156),
  Color.fromARGB(255, 9, 2, 32),
  Color.fromARGB(255, 56, 54, 109)
];
const List shadow1 = [
  Color.fromARGB(125, 34, 87, 74),
  Color.fromARGB(125, 221, 174, 140),
  Color.fromARGB(125, 156, 62, 54),
  Color.fromARGB(125, 255, 161, 132),
  Color.fromARGB(125, 47, 177, 254),
  Color.fromARGB(125, 54, 156, 156),
  Color.fromARGB(125, 9, 2, 32),
  Color.fromARGB(125, 56, 54, 109)
];
const List shadow2 = [
  Color.fromARGB(64, 34, 87, 74),
  Color.fromARGB(64, 221, 174, 140),
  Color.fromARGB(64, 156, 62, 54),
  Color.fromARGB(64, 255, 161, 132),
  Color.fromARGB(64, 47, 177, 254),
  Color.fromARGB(64, 54, 156, 156),
  Color.fromARGB(64, 9, 2, 32),
  Color.fromARGB(64, 56, 54, 109)
];

List items = [
  'Apple',
  'Spotify',
  'Netflix',
  'Microsoft',
  'Cred',
  'Uber',
  'LinkedIn',
  'Cred',
];
List img = [
  'assets/Apple.png',
  'assets/Spotify.png',
  'assets/Netflix.png',
  'assets/Microsoft.png',
  'assets/Cred.png',
  'assets/Uber.png',
  'assets/LinkedIn.png',
  'assets/Cred.png',
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(bottom: 30),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(5.0, 5.0),
                          )
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 169, 220, 243),
                            Color.fromARGB(255, 241, 165, 190),
                            Colors.white,
                          ],
                          stops: [
                            0.1,
                            0.5,
                            0.7,
                          ],
                        )),
                    child: Center(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Myheader(),
                                const SizedBox(
                                  height: 100,
                                ),
                                Container(
                                  child: Wrap(
                                    spacing: 30,
                                    runSpacing: 50,
                                    alignment: WrapAlignment.start,
                                    children: [
                                      for (i = 0; i < 8; i++)
                                        i < 3 || i > 5 ? MyBox1() : MyBox2(),
                                      //for (var i = 0; i < 3; i++) MyBox2(),
                                      //for (var i = 0; i < 2; i++) MyBox1()
                                    ],
                                  ),
                                ),
                              ],
                            )))))));
  }
}

class MyBox1 extends StatelessWidget {
  MyBox1({Key? key}) : super(key: key);
  final int j = i;
  @override
  Widget build(BuildContext context) {
    return HoverContainer(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        hoverDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: shadow1[j],
              blurRadius: 0.0,
              spreadRadius: -20,
              offset: Offset(0.0, 35.0),
            ),
            BoxShadow(
              color: shadow2[j],
              blurRadius: 0.0,
              spreadRadius: -40,
              offset: Offset(0.0, 70.0),
            ),
          ],
        ),
        child: SizedBox(
          width: 340,
          height: 254,
          child: Center(
            child: Stack(
              // clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: colors[j]),
                  width: 340,
                  height: 254,
                ),
                ClipPath(
                  child: Container(
                    alignment: Alignment(0, 12),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(img[j]),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(64, 0, 0, 0),
                              offset: Offset(
                                -4.0,
                                4.0,
                              ),
                              blurRadius: 30.0,
                              spreadRadius: 10.0,
                            )
                          ]),
                      height: 241.91,
                      width: 210.46,
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(0.8, -0.8),
                  child: Text(
                    items[j],
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Newfont3'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class MyBox2 extends StatelessWidget {
  MyBox2({Key? key}) : super(key: key);
  final int j = i;
  @override
  Widget build(BuildContext context) {
    return HoverContainer(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        hoverDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: shadow1[j],
              blurRadius: 0.0,
              spreadRadius: -20,
              offset: Offset(0.0, 35.0),
            ),
            BoxShadow(
              color: shadow2[j],
              blurRadius: 0.0,
              spreadRadius: -40,
              offset: Offset(0.0, 70.0),
            ),
          ],
        ),
        child: SizedBox(
          width: 340,
          height: 254,
          child: Center(
            child: Stack(
              // clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: colors[j]),
                  width: 340,
                  height: 254,
                ),
                ClipPath(
                  child: Transform.rotate(
                    angle: -45,
                    child: Container(
                      alignment: const Alignment(0, 18),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(img[j]),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(64, 0, 0, 0),
                                offset: Offset(
                                  -4.0,
                                  4.0,
                                ),
                                blurRadius: 30.0,
                                spreadRadius: 10.0,
                              )
                            ]),
                        height: 241.91,
                        width: 210.46,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(-0.8, -0.8),
                  child: Text(
                    items[j],
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'Newfont3'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Myheader extends StatelessWidget {
  const Myheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Column(
          children: const [
            SizedBox(
              height: 100,
            ),
            Text(
              'INTERVIEW EXPERIENCE',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: const [
            Text(
              'Get to know about your interview beforehand',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ],
    ));
  }
}
