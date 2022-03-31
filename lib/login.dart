import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:istasite/Projects/Projects.dart';
import 'package:istasite/Projects/Projectsform.dart';
import 'package:istasite/auth.dart';
import 'package:istasite/validate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
                child: Container(
              width: (width > 600) ? width * 0.4 : width * 0.7,
              height: height * 0.2,
              child: Image.asset(
                'assets/ISTAlogo.png',
              ),
            )),
            SizedBox(height: 20),
            Center(
              child: Container(
                  child: Form(
                key: formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(
                          width: (width > 800) ? width * 0.25 : width * 0.7,
                          //  width: width * 0.25,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 237, 237, 1.0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 15),
                            child: TextFormField(
                                controller: _emailTextController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Student Email ',
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                validator: (value) {
                                  if (value?.substring(4, 7) == "115" &&
                                      value?.substring(11) ==
                                          "student.annauniv.edu") {
                                    return null;
                                  } else {
                                    return "Invalid User";
                                  }
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: (width > 600) ? width * 0.20 : width * 0.6,
                          //  width: width * 0.20,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(9, 2, 32, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                // User? user =
                                //     await FireAuth.signInUsingEmailPassword(
                                //   email: _emailTextController.text,
                                //   password: _passwordTextController.text,
                                // );

                                // if (user != null) {
                                SharedPreferences session =
                                    await SharedPreferences.getInstance();
                                session.setString(
                                    "name", _emailTextController.text);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Projectform()
                                      //Projects(),
                                      ),
                                );
                                //}
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ]),
              )),
            )
          ],
        ),
      ),
    );
  }
}
