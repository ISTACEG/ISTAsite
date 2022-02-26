// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'postClass.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  _search createState() => _search();
}

class _search extends State<search> {
  final List<Post> _posts = [
    Post(
        'AR SHOPPING APP',
        'tech stack',
        ['ar vr', 'flutter'],
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam molestie, magna et scelerisque consequat, urna nisi bibendum lorem, nec fermentum est urna id urna. Nam posuere nibh tristique fermentum pellentesque. Ut lacus eros, consequat consectetur efficitur at, dignissim sit amet nibh. Sed nibh libero, vestibulum dignissim purus vitae, rhoncus finibus est. Cras tristique tempor elit eu volutpat. Nunc rhoncus neque interdum massa sollicitudin mollis. Duis in risus eget orci eleifend placerat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin luctus mi vel dolor fringilla suscipit.",
        'https://picsum.photos/250?image=9'),
    Post(
        'BLOCKCHAIN DEVELOPMENT',
        'tech stack',
        ['ar vr', 'flutter'],
        "Lorem ethereumbitcoin ipsum dolor sit amet, consectetur adipiscing elit. Etiam molestie, magna et scelerisque consequat, urna nisi bibendum lorem, nec fermentum est urna id urna. Nam posuere nibh tristique fermentum pellentesque. Ut lacus eros, consequat consectetur efficitur at, dignissim sit amet nibh. Sed nibh libero, vestibulum dignissim purus vitae, rhoncus finibus est. Cras tristique tempor elit eu volutpat. Nunc rhoncus neque interdum massa sollicitudin mollis. Duis in risus eget orci eleifend placerat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin luctus mi vel dolor fringilla suscipit.",
        'https://picsum.photos/250?image=9'),
    Post(
        'PENETRATION TESTING',
        'tech stack',
        ['ar vr', 'flutter'],
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam molestie, magna et scelerisque consequat, urna nisi bibendum lorem, nec fermentum est urna id urna. Nam posuere nibh tristique fermentum pellentesque. Ut lacus eros, consequat consectetur efficitur at, dignissim sit amet nibh. Sed nibh libero, vestibulum dignissim purus vitae, rhoncus finibus est. Cras tristique tempor elit eu volutpat. Nunc rhoncus neque interdum massa sollicitudin mollis. Duis in risus eget orci eleifend placerat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin luctus mi vel dolor fringilla suscipit.",
        'https://picsum.photos/250?image=9'),
    Post(
        'DATA STRUCTURE',
        'tech stack',
        ['ar vr', 'flutter'],
        "Lorem ipsum datadatadata dolor sit amet, consectetur adipiscing elit. Etiam molestie, magna et scelerisque consequat, urna nisi bibendum lorem, nec fermentum est urna id urna. Nam posuere nibh tristique fermentum pellentesque. Ut lacus eros, consequat consectetur efficitur at, dignissim sit amet nibh. Sed nibh libero, vestibulum dignissim purus vitae, rhoncus finibus est. Cras tristique tempor elit eu volutpat. Nunc rhoncus neque interdum massa sollicitudin mollis. Duis in risus eget orci eleifend placerat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin luctus mi vel dolor fringilla suscipit.",
        'https://picsum.photos/250?image=9')
  ];

  List<Post> _foundposts = [];

  double width = 0, height = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _foundposts = _posts;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundposts = _posts
          .where((post) =>
              post.title.toLowerCase().contains(search) ||
              post.description.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    String keyword;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height * 0.1,
          margin: EdgeInsets.symmetric(vertical: height * 0.1),
          child: Center(
            child: SizedBox(
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
        ),
        Container(
          width: 1000,
          height: height * 0.7,
          child: _foundposts.length > 0
              ? ListView.builder(
                  itemCount: _foundposts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: postComponent(post: _foundposts[index]),
                    );
                  })
              : Center(
                  child: Text(
                  "No posts found",
                  style: TextStyle(color: Colors.white),
                )),
        ),
      ],
    ));
  }

  postComponent({required Post post}) {
    return Column(
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
                            image: NetworkImage(post.imageurl),
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
                        child: Text(post.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 10),
                      Text(post.domain),
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
                                        color: Color.fromRGBO(9, 2, 32, 0.25),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              post.tags[tagindex],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(post.imageurl),
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
                              child: Text(post.description))
                          : Container(),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () async {
                          await launch(
                              "https://api.flutter.dev/flutter/material/Icons/arrow_forward-constant.html");
                        },
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
    );
  }

//postcomponent
}
