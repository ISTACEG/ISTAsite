import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:istasite/Projects/Projects.dart';
import 'package:istasite/auth.dart';
import 'package:istasite/validate.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //text field state
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => log(),
      //   ),
      // );
    }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 30),
                        child: Center(
                          child: Container(
                              width: (width > 600) ? width * 0.4 : width * 0.7,
                              //  width: width * 0.4,
                              height: height * 0.2,
                              /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                              child: Image.asset('assets/ISTAlogo.png')),
                        ),
                      ),
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
                                hintText: 'Email ',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              validator: (value) => Validator.validateEmail(
                                email: value,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(
                          width: (width > 800) ? width * 0.25 : width * 0.7,
                          //width: width * 0.25,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 237, 237, 1.0),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 15),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: _passwordTextController,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hoverColor: Color.alphaBlend(
                                    Colors.black, Colors.black),
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              validator: (value) => Validator.validatePassword(
                                password: value,
                              ),
                            ),
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
                          child: FlatButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                User? user =
                                    await FireAuth.signInUsingEmailPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                );

                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => Projects(),
                                    ),
                                  );
                                }
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
                    ],
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
