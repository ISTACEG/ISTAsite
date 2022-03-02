import 'package:flutter/material.dart';

Future contactDialogBox(BuildContext context, double width, double height,
    List<Map<String, String>> contact) {
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
            height: height * 0.4,
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
                          "Team Details",
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
                  width: (width > 800) ? width * 0.4 * 0.9 : width * 0.6 * 0.9,
                  height: height * 0.4 * 0.8,
                  child: ListView.builder(
                      itemCount: contact.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                              width: (width > 800)
                                  ? width * 0.4 * 0.9
                                  : width * 0.6 * 0.9,
                              height: height * 0.4 * 0.3,
                              decoration: BoxDecoration(
                                color: Color(0xffededed),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: (width > 800)
                                        ? width * 0.4 * 0.9 * 0.9
                                        : width * 0.6 * 0.9 * 0.9,
                                    child: Center(
                                      child: Text(
                                        "${contact[index]['Name']}",
                                        style: TextStyle(
                                            fontFamily: 'InterBold',
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: (width > 800)
                                        ? width * 0.4 * 0.9 * 0.9
                                        : width * 0.6 * 0.9 * 0.9,
                                    child: Center(
                                      child: Text(
                                        "${contact[index]['Rollno']}",
                                        style: TextStyle(
                                            fontFamily: 'InterBold',
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                      width: (width > 800)
                                          ? width * 0.4 * 0.9 * 0.9
                                          : width * 0.6 * 0.9 * 0.9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.contacts),
                                          Center(
                                            child: Text(
                                              "${contact[index]['Contact']}",
                                              style: TextStyle(
                                                  fontFamily: 'InterBold',
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ],
                        );
                      })),
                ),
              ],
            ),
          ),
        );
      });
}
