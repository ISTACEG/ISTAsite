// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:textfield_tags/textfield_tags.dart';

class Projectform extends StatefulWidget {
  const Projectform({Key? key}) : super(key: key);

  @override
  _ProjectformState createState() => _ProjectformState();
}

class _ProjectformState extends State<Projectform> {
  double width = 0, height = 0;

  final projecttitle = TextEditingController();
  final projectdescription = TextEditingController();
  final projectgitlink = TextEditingController();

  int currentstep = 0;
  int isstepcancel = 1;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Material(
        child: Stepper(
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: details.onStepContinue,
                child: const Text('Next'),
              ),
              const SizedBox(
                width: 30,
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: (isstepcancel == 1) ? Text('Cancel') : Text('Back'),
              ),
            ],
          ),
        );
      },
      type: (width > 800) ? StepperType.horizontal : StepperType.vertical,
      steps: getSteps(),
      currentStep: currentstep,
      onStepContinue: () {
        if (currentstep > 4) {
          currentstep = 4;
        } else {
          setState(() {
            isstepcancel = 0;
            currentstep += 1;
          });
        }
      },
      onStepCancel: () {
        if (currentstep == 0) {
          setState(() {
            isstepcancel = 1;
            currentstep = 0;
          });
        } else {
          setState(() {
            if (currentstep == 1) {
              isstepcancel = 1;
            }
            currentstep -= 1;
          });
        }
      },
    ));
  }

  List<Step> getSteps() {
    // ignore: constant_identifier_names

    return [
      Step(
          title: (width > 800) ? Text('Project details') : Text(''),
          content: Container(
            margin: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: projecttitle,
                  decoration: InputDecoration(
                      labelText: 'Enter your project title',
                      border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: projectdescription,
                  decoration: InputDecoration(
                    labelText: 'Enter your project description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: projectgitlink,
                  decoration: InputDecoration(
                    labelText: 'Enter your project\'s github repo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ]),
          ),
          isActive: currentstep >= 0),
      Step(
          title: (width > 800) ? Text('Cover Image') : Text(''),
          content: Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    children: [Text('Image Upload')],
                  )),
            ],
          ),
          isActive: currentstep >= 1),
      Step(
          title: (width > 800) ? Text('Tags') : Text(''),
          content: Container(
              child: TextFieldTags(
                  onDelete: (String tag) {},
                  onTag: (String tag) {},
                  tagsStyler: TagsStyler(
                    tagTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    tagDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 75, 204, 95),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    tagCancelIcon: Icon(Icons.cancel,
                        size: 16.0, color: Color.fromARGB(255, 255, 0, 0)),
                    tagPadding: const EdgeInsets.all(10.0),
                  ),
                  textFieldStyler: TextFieldStyler(
                    hintText: "Tags",
                    isDense: false,
                    textFieldFocusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                    textFieldBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  validator: (tag) {
                    if (tag.length > 25) {
                      return "Tag length is too long";
                    }
                    return null;
                  })),
          isActive: currentstep >= 2),
      Step(
          title: (width > 800) ? Text('Preview & Upload') : Text(''),
          content: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: width * 0.68 * 0.9,
                // height: 250,
                decoration: BoxDecoration(
                    color: Color(0xffededed),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (width > 800)
                        ? Container(
                            width: width * 0.68 * 0.9 * 0.23,
                            // height: 170,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg'),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Container(
                        width: width * 0.68 * 0.9 * 0.7,
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.68 * 0.9 * 0.68,
                              child: Text(projecttitle.text,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 10),
                            Text('Technologies used'),
                            SizedBox(
                              width: width * 0.68 * 0.9 * 0.68,
                              height: 40,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 2,
                                  itemBuilder: (context, tagindex) {
                                    return Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  9, 2, 32, 0.25),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.ad_units_rounded,
                                                  size: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'tags',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              ]),
                                        ),
                                        SizedBox(width: 10)
                                      ],
                                    );
                                  }),
                            ),
                            SizedBox(height: 10),
                            (width < 800)
                                ? SizedBox(
                                    width: width * 0.68 * 0.9 * 0.6,
                                    child: Center(
                                      child: Container(
                                        width: width * 0.68 * 0.9 * 0.4,
                                        // height: 170,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image(
                                              image: NetworkImage(
                                                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            (width < 800) ? SizedBox(height: 10) : Container(),
                            (width > 800)
                                ? SizedBox(
                                    width: width * 0.68 * 0.9 * 0.68,
                                    child: Text(projectdescription.text))
                                : Container(),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  Text("View Project",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
          isActive: currentstep >= 3)
    ];
  }
}
