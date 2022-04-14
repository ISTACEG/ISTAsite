import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:istasite/Components/classes.dart';
import 'package:istasite/InterviewExperience/InterviewExperience.dart';

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

class Interview extends StatefulWidget {
  const Interview({Key? key}) : super(key: key);

  @override
  State<Interview> createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
  List<Company> companies = [];
  void initState() {
    fetchCompanies();
  }

  void fetchCompanies() async {
    List<Company> companies_db = [];
    await FirebaseFirestore.instance
        .collection("InterviewExperience")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        companies_db.add(Company(
            name: element.data()['CompanyName'],
            docid: element.data()['docid'],
            img: element.data()['imgPath']));
      });
      setState(() {
        companies = companies_db;
      });
    });
  }

  Widget Myheader() {
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
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'InterBold'),
            ),
          ],
        ),
        Column(
          children: const [
            Text(
              'Get to know about your interview beforehand',
              style: TextStyle(fontSize: 25, fontFamily: 'InterBold'),
            ),
          ],
        ),
      ],
    ));
  }

  Widget MyBox1() {
    int j = i;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InterviewExperience(
                      company: companies[j],
                    )));
      },
      child: HoverContainer(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          hoverDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: shadow1[j % 8],
                blurRadius: 0.0,
                spreadRadius: -20,
                offset: Offset(0.0, 35.0),
              ),
              BoxShadow(
                color: shadow2[j % 8],
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
                        color: colors[j % 8]),
                    width: 340,
                    height: 254,
                  ),
                  ClipPath(
                    child: Container(
                      alignment: Alignment(0, 12),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(companies[j].img),
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
                      companies[j].name,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'InterBold'),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

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
                                      for (i = 0; i < companies.length; i++)
                                        MyBox1()
                                      //for (var i = 0; i < 3; i++) MyBox2(),
                                      //for (var i = 0; i < 2; i++) MyBox1()
                                    ],
                                  ),
                                ),
                              ],
                            )))))));
  }
}
