import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:istasite/Homepage/Homepage.dart';
import 'package:istasite/InterviewExperience/InterviewExperience.dart';

import 'package:istasite/Projects/contactDialogbox.dart';
import 'package:url_launcher/url_launcher.dart';
import '../InterviewExperience/InterviewExpPage1.dart';
import 'postClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String tagSelected = "All";
  List<Post> _foundposts = [];
  bool pressAction = true;
  bool pressAction1 = false;
  bool pressAction2 = false;
  List<bool> taglist = [true];
  final List<String> alltags = ['All'];
  //   'All',
  //   'Machine Learning',
  //   'Augmented Reality',
  //   'Data Analysis',
  //   'Deep Learning',
  //   'Virtul Reality',
  //   'Machine Learning',
  //   'Augmented Reality',
  //   'Data Analysis',
  //   'Deep Learning',
  // ];
  List<Post> posts = [];
  //   Post(
  //       title: 'AR SHOPPING APP 0',
  //       domain: 'tech stack',
  //       tags: ['Machine Learning', 'flutter'],
  //       description:
  //           'Cart is an AR-based E-Shopping Mobile Application. The main idea is to narrow down the gap between reality shopping and e-shopping by using Augmented Reality. Users are allowed to try out available merchandise and can also superimpose 3D products bound to their environment before buying. This builds trust and adds value to the business at less cost. ',
  //       imageurl:
  //           'https://sopa.tulane.edu/sites/sopa.tulane.edu/files/tulane-sopa-vr-blog-photo.jpeg',
  //       gitlink: 'https://github.com/ISTACEG/ISTAsite/tree/main',
  //       time: 2,
  //       contact: [
  //         {
  //           'Name': 'Balasubramaniam M',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         }
  //       ]),
  //   Post(
  //       title: 'AR SHOPPING APP 1',
  //       domain: 'tech stack',
  //       tags: ['Virtual Reality', 'flutter'],
  //       description:
  //           'Cart is an AR-based E-Shopping Mobile Application. The main idea is to narrow down the gap between reality shopping and e-shopping by using Augmented Reality. Users are allowed to try out available merchandise and can also superimpose 3D products bound to their environment before buying. This builds trust and adds value to the business at less cost. ',
  //       imageurl:
  //           'https://sopa.tulane.edu/sites/sopa.tulane.edu/files/tulane-sopa-vr-blog-photo.jpeg',
  //       gitlink: 'https://github.com/ISTACEG/ISTAsite/tree/main',
  //       time: 3,
  //       contact: [
  //         {
  //           'Name': 'Balasubramaniam M',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         }
  //       ]),
  //   Post(
  //       title: 'AR SHOPPING APP 2',
  //       domain: 'tech stack',
  //       tags: ['Augmented Reality', 'flutter'],
  //       description:
  //           'Cart is an AR-based E-Shopping Mobile Application. The main idea is to narrow down the gap between reality shopping and e-shopping by using Augmented Reality. Users are allowed to try out available merchandise and can also superimpose 3D products bound to their environment before buying. This builds trust and adds value to the business at less cost. ',
  //       imageurl:
  //           'https://sopa.tulane.edu/sites/sopa.tulane.edu/files/tulane-sopa-vr-blog-photo.jpeg',
  //       gitlink: 'https://github.com/ISTACEG/ISTAsite/tree/main',
  //       time: 4,
  //       contact: [
  //         {
  //           'Name': 'Balasubramaniam M',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         }
  //       ]),
  //   Post(
  //       title: 'AR SHOPPING APP 3',
  //       domain: 'tech stack',
  //       tags: ['Data Analysis', 'flutter'],
  //       description:
  //           'Cart is an AR-based E-Shopping Mobile Application. The main idea is to narrow down the gap between reality shopping and e-shopping by using Augmented Reality. Users are allowed to try out available merchandise and can also superimpose 3D products bound to their environment before buying. This builds trust and adds value to the business at less cost. ',
  //       imageurl:
  //           'https://sopa.tulane.edu/sites/sopa.tulane.edu/files/tulane-sopa-vr-blog-photo.jpeg',
  //       gitlink: 'https://github.com/ISTACEG/ISTAsite/tree/main',
  //       time: 5,
  //       contact: [
  //         {
  //           'Name': 'Balasubramaniam M',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         }
  //       ]),
  //   Post(
  //       title: 'AR SHOPPING APP 4',
  //       domain: 'tech stack',
  //       tags: ['Machine Learning', 'flutter'],
  //       description:
  //           'Cart is an AR-based E-Shopping Mobile Application. The main idea is to narrow down the gap between reality shopping and e-shopping by using Augmented Reality. Users are allowed to try out available merchandise and can also superimpose 3D products bound to their environment before buying. This builds trust and adds value to the business at less cost. ',
  //       imageurl:
  //           'https://sopa.tulane.edu/sites/sopa.tulane.edu/files/tulane-sopa-vr-blog-photo.jpeg',
  //       gitlink: 'https://github.com/ISTACEG/ISTAsite/tree/main',
  //       time: 0,
  //       contact: [
  //         {
  //           'Name': 'Balasubramaniam M',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         }
  //       ]),
  //   Post(
  //       title: 'AR SHOPPING APP 5',
  //       domain: 'tech stack',
  //       tags: ['Machine Learning', 'Augmented Reality'],
  //       description:
  //           'Cart is an AR-based E-Shopping Mobile Application. The main idea is to narrow down the gap between reality shopping and e-shopping by using Augmented Reality. Users are allowed to try out available merchandise and can also superimpose 3D products bound to their environment before buying. This builds trust and adds value to the business at less cost. ',
  //       imageurl:
  //           'https://sopa.tulane.edu/sites/sopa.tulane.edu/files/tulane-sopa-vr-blog-photo.jpeg',
  //       gitlink: 'https://github.com/ISTACEG/ISTAsite/tree/main',
  //       time: 1,
  //       contact: [
  //         {
  //           'Name': 'Balasubramaniam M',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         },
  //         {
  //           'Name': 'Balasubramaniam',
  //           'Rollno': '2018115018',
  //           'Contact': '6385490321'
  //         }
  //       ]),
  // ];

  @override
  void initState() {
    super.initState();
    fetchprojects();
  }

  void fetchprojects() async {
    List<Post> projects = [];
    await FirebaseFirestore.instance
        .collection("Projects")
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((element) {
        projects.add(Post(
            projectId: element.data()['ProjectId'],
            title: element.data()['Title'],
            description: element.data()['Description'],
            tags: element.data()['Tags'],
            imageurl: element.data()['Image_url'],
            gitlink: element.data()['Git_url'],
            time: element.data()['YearOfCompletion'] * 10 +
                element.data()['MonthOfCompletion'],
            contact: element.data()['Team']));
      });
      setState(() {
        posts = projects;
      });
    });
    setState(() {
      _foundposts = posts;
      for (int i = 0; i < posts.length; i++)
        for (int j = 0; j < posts[i].tags.length; j++)
          if (!alltags.contains(posts[i].tags[j]))
            alltags.add(posts[i].tags[j]);
      for (int i = 0; i < alltags.length; i++) taglist.add(false);
    });
  }

  onSearch(String search) {
    setState(() {
      _foundposts = posts
          .where((post) =>
              post.title.toLowerCase().contains(search.toLowerCase()) ||
              post.description.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  onsortfilter(String tag) {
    if (tag == "A-Z") {
      setState(() {
        _foundposts.sort((a, b) => a.title.compareTo(b.title));
      });
    } else if (tag == "Latest-Oldest") {
      setState(() {
        _foundposts.sort((a, b) => b.time.compareTo(a.time));
      });
    } else {
      setState(() {
        _foundposts.sort((a, b) => a.time.compareTo(b.time));
      });
    }
  }

  ontagfilter(String tag) {
    if (tag == "All") {
      setState(() {
        tagSelected = tag;
        _foundposts = posts;
      });
    } else {
      setState(() {
        tagSelected = tag;
        _foundposts = posts.where((post) => post.tags.contains(tag)).toList();
      });
    }
  }

  Widget Hamburger(BuildContext context, double width, double height) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            const Text(
              "Sort by",
              style: TextStyle(
                  fontFamily: 'InterBold',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: width * 0.6,
              child: InkWell(
                onTap: (() {
                  setState(() {
                    pressAction = !pressAction;
                    if (pressAction == true) {
                      pressAction1 = false;
                      pressAction2 = false;
                    }
                    onsortfilter("A-Z");

                    Navigator.pop(context);
                  });
                }),
                child: Container(
                    width: width * 0.6 * 0.9,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffededed),
                        border: Border.all(
                          width: 3,
                          color: pressAction ? Colors.black : Color(0xffc4c4c4),
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'A-Z',
                        style: TextStyle(
                          fontFamily: 'InterBold',
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: (() {
                setState(() {
                  pressAction1 = !pressAction1;
                  if (pressAction1 == true) {
                    pressAction = false;
                    pressAction2 = false;
                  }
                  if (pressAction1) {
                    onsortfilter("Latest-Oldest");
                  } else {
                    pressAction = true;
                    onsortfilter('A-Z');
                  }
                  Navigator.pop(context);
                });
              }),
              child: Container(
                  width: width * 0.28 * 0.6,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xffededed),
                      border: Border.all(
                        width: 3,
                        color: pressAction1 ? Colors.black : Color(0xffc4c4c4),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      'Latest-Oldest',
                      style: TextStyle(fontFamily: 'InterBold'),
                    ),
                  )),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: (() {
                setState(() {
                  pressAction2 = !pressAction2;
                  if (pressAction2 == true) {
                    pressAction1 = false;
                    pressAction = false;
                  }
                  if (pressAction2) {
                    onsortfilter("Oldest-Latest");
                  } else {
                    pressAction = true;
                    onsortfilter('A-Z');
                  }
                  Navigator.pop(context);
                });
              }),
              child: Container(
                  width: width * 0.28 * 0.6,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xffededed),
                      border: Border.all(
                        width: 3,
                        color: pressAction2 ? Colors.black : Color(0xffc4c4c4),
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      'Oldest-Latest',
                      style: TextStyle(fontFamily: 'InterBold'),
                    ),
                  )),
            ),
            SizedBox(height: 10),
            const Text(
              "Tags",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'InterBold',
                  fontSize: 18),
            ),
            SizedBox(height: 5),
            Container(
              width: width * 0.6,
              height: height * 0.6,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: alltags.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (() {
                            for (int i = 0; i < alltags.length; i++)
                              taglist[i] = false;
                            taglist[index] = true;
                            ontagfilter(alltags[index]);
                            Navigator.pop(context);
                          }),
                          child: Container(
                              width: width * 0.6 * 0.9,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xffededed),
                                  border: Border.all(
                                    width: 3,
                                    color: taglist[index]
                                        ? Colors.black
                                        : Color(0xffc4c4c4),
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  alltags[index],
                                  style: TextStyle(fontFamily: 'InterBold'),
                                ),
                              )),
                        ),
                        SizedBox(height: 5)
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget Sort(double width, double height, BuildContext context) {
    return Container(
      width: width * 0.28 * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.05,
          ),
          const Text(
            "Sort by",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'InterBold',
                fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (() {
                    setState(() {
                      pressAction = !pressAction;
                      if (pressAction == true) {
                        pressAction1 = false;
                        pressAction2 = false;
                      }
                      onsortfilter("A-Z");
                    });
                  }),
                  child: Container(
                      width: (width > 850)
                          ? width * 0.28 * 0.4
                          : width * 0.28 * 0.6,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffededed),
                          border: Border.all(
                            width: 3,
                            color:
                                pressAction ? Colors.black : Color(0xffc4c4c4),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          'A-Z',
                          style: TextStyle(fontFamily: 'InterBold'),
                        ),
                      )),
                ),
                (width > 850)
                    ? InkWell(
                        onTap: (() {
                          setState(() {
                            pressAction1 = !pressAction1;
                            if (pressAction1 == true) {
                              pressAction = false;
                              pressAction2 = false;
                            }
                            if (pressAction1) {
                              onsortfilter("Latest-Oldest");
                            } else {
                              pressAction = true;
                              onsortfilter('A-Z');
                            }
                          });
                        }),
                        child: Container(
                            width: width * 0.28 * 0.4,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffededed),
                                border: Border.all(
                                    width: 3,
                                    color: pressAction1
                                        ? Colors.black
                                        : Color(0xffc4c4c4)),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'Latest-Oldest',
                                style: TextStyle(fontFamily: 'InterBold'),
                              ),
                            )),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(height: 5),
          (width > 850)
              ? Container()
              : InkWell(
                  onTap: (() {
                    setState(() {
                      pressAction1 = !pressAction1;
                      if (pressAction1 == true) {
                        pressAction = false;
                        pressAction2 = false;
                      }
                      if (pressAction1) {
                        onsortfilter("Latest-Oldest");
                      } else {
                        pressAction = true;
                        onsortfilter('A-Z');
                      }
                    });
                  }),
                  child: Container(
                      width: width * 0.28 * 0.6,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xffededed),
                          border: Border.all(
                              width: 3,
                              color: pressAction1
                                  ? Colors.black
                                  : Color(0xffc4c4c4)),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          'Latest-Oldest',
                          style: TextStyle(fontFamily: 'InterBold'),
                        ),
                      )),
                ),
          (width > 850) ? Container() : SizedBox(height: 5),
          InkWell(
            onTap: (() {
              setState(() {
                pressAction2 = !pressAction2;
                if (pressAction2 == true) {
                  pressAction = false;
                  pressAction1 = false;
                }
                if (pressAction2) {
                  onsortfilter("Oldest-Latest");
                } else {
                  pressAction = true;
                  onsortfilter('A-Z');
                }
              });
            }),
            child: Container(
                width: (width > 850) ? width * 0.28 * 0.4 : width * 0.28 * 0.6,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xffededed),
                    border: Border.all(
                      width: 3,
                      color: pressAction2 ? Colors.black : Color(0xffc4c4c4),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    'Oldest- Latest',
                    style: TextStyle(fontFamily: 'InterBold'),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget tag(double width, double height, BuildContext context) {
    bool pressAction = false;

    return Container(
      width: width * 0.28 * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tags",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: 'InterBold',
                fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            width: width * 0.28 * 0.9,
            height: height * 0.6,
            child: (width > 850)
                ? GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 5),
                    scrollDirection: Axis.vertical,
                    itemCount: alltags.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() {
                              for (int i = 0; i < alltags.length; i++)
                                taglist[i] = false;
                              taglist[index] = true;
                              ontagfilter(alltags[index]);
                            }),
                            child: Container(
                                width: (width > 850)
                                    ? width * 0.28 * 0.4
                                    : width * 0.28 * 0.6,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xffededed),
                                    border: Border.all(
                                      width: 3,
                                      color: taglist[index]
                                          ? Colors.black
                                          : Color(0xffc4c4c4),
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    alltags[index],
                                    style: TextStyle(fontFamily: 'InterBold'),
                                  ),
                                )),
                          )
                        ],
                      );
                    })
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: alltags.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() {
                              for (int i = 0; i < alltags.length; i++)
                                taglist[i] = false;
                              taglist[index] = true;
                              ontagfilter(alltags[index]);
                            }),
                            child: Container(
                                width: (width > 850)
                                    ? width * 0.28 * 0.4
                                    : width * 0.28 * 0.6,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xffededed),
                                    border: Border.all(
                                      width: 3,
                                      color: taglist[index]
                                          ? Colors.black
                                          : Color(0xffc4c4c4),
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    alltags[index],
                                    style: TextStyle(fontFamily: 'InterBold'),
                                  ),
                                )),
                          ),
                          SizedBox(height: 5)
                        ],
                      );
                    }),
          ),
        ],
      ),
    );
  }

  Widget postComponent(Post post, double width, double height) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width: (width > 600) ? width * 0.68 * 0.9 : width * 0.9 * 0.9,
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
                            child: Image.asset("assets/bg.jpg")),
                      ),
                    )
                  : Container(),
              Container(
                  width: (width > 800)
                      ? width * 0.68 * 0.9 * 0.7
                      : (width > 600)
                          ? width * 0.9 * 0.9 * 0.7
                          : width * 0.9 * 0.9 * 0.9,
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: (width > 800)
                            ? width * 0.68 * 0.9 * 0.68
                            : (width > 600)
                                ? width * 0.9 * 0.9 * 0.68
                                : width * 0.9 * 0.9 * 0.9,
                        child: Text(post.title,
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'InterBold')),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "TECHNOLOGIES USED",
                        style: TextStyle(fontFamily: 'InterLight'),
                      ),
                      Container(
                        width: (width > 800)
                            ? width * 0.68 * 0.9 * 0.68
                            : (width > 600)
                                ? width * 0.9 * 0.9 * 0.68
                                : width * 0.9 * 0.9 * 0.9,
                        height: 40,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: post.tags.length,
                            itemBuilder: (context, tagindex) {
                              return Row(
                                children: [
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(9, 2, 32, 0.25),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.code,
                                            size: 20,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              post.tags[tagindex],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'InterBold'),
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
                          ? Container(
                              width: (width > 600)
                                  ? width * 0.68 * 0.9 * 0.9
                                  : width * 0.9 * 0.9 * 0.9,
                              child: Center(
                                child: Container(
                                  width: (width > 600)
                                      ? width * 0.68 * 0.9 * 0.4
                                      : width * 0.9 * 0.9 * 0.4,
                                  // height: 170,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset("assets/bg.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      (width < 800) ? SizedBox(height: 10) : Container(),
                      // (width > 800)
                      //     ? Container(
                      //         width: width * 0.68 * 0.9 * 0.68,
                      //         child: Text(post.description))
                      //     : Container(),
                      Text(
                        post.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'InterLight',
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: (width > 600)
                            ? width * 0.68 * 0.9 * 0.9
                            : width * 0.9 * 0.9 * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: InkWell(
                                onTap: () async {
                                  await launch(post.gitlink);
                                },
                                child: Row(
                                  children: [
                                    Text("View Project",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'InterBold')),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  contactDialogBox(
                                      context, width, height, post.contact);
                                },
                                icon: Icon(Icons.person))
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget searchBar(double width, double height) {
    return Container(
      width: (width > 600) ? width * 0.68 * 0.9 : width * 0.9 * 0.9,
      height: height * 0.05,
      child: Center(
        child: Container(
          width: width * 0.75,
          child: Center(
            child: TextField(
              onChanged: (value) => onSearch(value),
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  hintText: "Search for projects"),
            ),
          ),
        ),
      ),
    );
  }

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return (posts.isEmpty)
        ? Center(
            child: Container(
                width: 20, height: 20, child: CircularProgressIndicator()))
        : Scaffold(
            key: _scaffoldKey,
            drawer: Hamburger(context, width, height),
            body: Container(
              width: width,
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: (width > 600) ? width * 0.68 : width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        (width > 600)
                            ? Container(
                                width: (width > 600)
                                    ? width * 0.68 * 0.9
                                    : width * 0.9 * 0.9,
                                child: Text(
                                  "Projects",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'HomemadeApple',
                                      fontWeight: FontWeight.w600,
                                      foreground: Paint()
                                        ..shader = LinearGradient(
                                          colors: <Color>[
                                            Color(0xff068293),
                                            Color(0xff00a7a7),
                                            Color(0xff00c366)
                                          ],
                                        ).createShader(Rect.fromLTWH(
                                            0.0, 0.0, 200.0, 70.0))),
                                ))
                            : Container(
                                width: (width > 600)
                                    ? width * 0.68 * 0.9
                                    : width * 0.9 * 0.9,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _scaffoldKey.currentState
                                              ?.openDrawer();
                                        },
                                        icon: Icon(Icons.menu)),
                                    Container(
                                      width: (width > 600)
                                          ? width * 0.68 * 0.9
                                          : width * 0.9 * 0.7,
                                      child: Center(
                                        child: Text(
                                          "Projects",
                                          style: TextStyle(
                                              fontFamily: 'HomemadeApple',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25,
                                              foreground: Paint()
                                                ..shader = LinearGradient(
                                                  colors: <Color>[
                                                    Color(0xff068293),
                                                    Color(0xff00a7a7),
                                                    Color(0xff00c366)
                                                  ],
                                                ).createShader(Rect.fromLTWH(
                                                    0.0, 0.0, 200.0, 70.0))),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                        searchBar(width, height),
                        Container(
                          width: (width > 600)
                              ? width * 0.68 * 0.9
                              : width * 0.9 * 0.9,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_downward),
                                Container(
                                  width: (width > 600)
                                      ? width * 0.68 * 0.8
                                      : width * 0.9 * 0.8,
                                  child: Text(
                                    "Showing ${_foundposts.length} results for ${tagSelected}",
                                    style: TextStyle(
                                        fontFamily: 'InterLight',
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ]),
                        ),
                        Container(
                            width: (width > 600) ? width * 0.68 : width * 0.9,
                            height: height * 0.8,
                            // child: _foundposts.length > 0
                            //     ?
                            child: Center(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: _foundposts.length,
                                  itemBuilder: (context, index) {
                                    return postComponent(
                                        _foundposts[index], width, height);
                                  }),
                            )
                            // : Center(
                            //     child: Text(
                            //     "No Projects found",
                            //   )),
                            ),
                      ],
                    ),
                  ),
                  (width > 600)
                      ? Container(
                          width: width * 0.28,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Sort(width, height, context),
                              SizedBox(height: 15),
                              tag(width, height, context)
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              openCloseDial: isDialOpen,
              backgroundColor: Colors.black,
              overlayColor: Colors.grey,
              overlayOpacity: 0.5,
              spacing: 15,
              spaceBetweenChildren: 15,
              closeManually: true,
              children: [
                SpeedDialChild(
                    child: Icon(Icons.home),
                    label: "Home",
                    onTap: () {
                      isDialOpen.value = false;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    }),
                SpeedDialChild(
                    child: Icon(Icons.book),
                    label: "Magazine",
                    onTap: () {
                      isDialOpen.value = false;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    }),
                SpeedDialChild(
                    child: Icon(Icons.emoji_emotions),
                    label: "Interview Experience",
                    onTap: () {
                      isDialOpen.value = false;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Interview()));
                    }),
              ],
            ),
          );
  }
}
