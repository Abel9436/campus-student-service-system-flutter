// ignore: file_names
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:servisify/pages/loginn.dart';
import 'package:servisify/pages/signup.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  void dialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          icon: Icon(
            Icons.email,
            size: 100,
            color: Color.fromARGB(255, 45, 67, 78),
          ),
          content: Text(
            'Check your Email. We have sent you a verification link. You have 3 minutes to verify!',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/verify');
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget navbar(String text) {
    return TextButton(
      onPressed: () {
        switch (text) {
          case 'service':
            dialog();
            break;
        }
      },
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }

  var scale = 1.0;
  bool isglowing = false;
  Color mycolor2 = Colors.black;
  Color mycolor = Color.fromARGB(255, 54, 114, 255);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width < 900 ? 30 : 70),
            Padding(
              padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width < 900 ? 0 : 0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image(
                      image: AssetImage('assets/logo.png'),
                      height:
                          MediaQuery.of(context).size.width < 900 ? 30 : 100,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 5),
                    navbar('Home'),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                    navbar('Services'),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                    navbar('About Us'),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                    navbar('Contact Us'), // Corrected the typo in 'service'

                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Login();
                          },
                        );
                      },
                      child: Container(
                        height:
                            MediaQuery.of(context).size.width < 900 ? 30 : 50,
                        width:
                            MediaQuery.of(context).size.width < 900 ? 80 : 150,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 150, 181),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //SizedBox(height: MediaQuery.of(context).size.width < 900 ? 25 : 50),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Container(
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: 'The ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      900
                                                  ? 30
                                                  : 70),
                                        ),
                                        TextSpan(
                                          text: 'First ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 0, 150, 181),
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      900
                                                  ? 30
                                                  : 70),
                                        ),
                                        TextSpan(
                                          text: ' Student Service\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      900
                                                  ? 30
                                                  : 70),
                                        ),
                                        TextSpan(
                                          text: 'Provider',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 0, 150, 181),
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      900
                                                  ? 30
                                                  : 70),
                                        ),
                                        TextSpan(
                                          text: ' For campus ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      900
                                                  ? 30
                                                  : 70),
                                        ),
                                        TextSpan(
                                          text: '  Students',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 0, 150, 181),
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      900
                                                  ? 30
                                                  : 70),
                                        ),
                                      ])),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          alignment: Alignment(0.5, 0.5),
                                          child: Lottie.asset(
                                              'assets/land.json',
                                              height: 400)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Signup();
                            },
                          );
                        },
                        child: MouseRegion(
                          onHover: (val) {
                            setState(() {
                              isglowing = true;
                              scale = 1.05;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              isglowing = false;
                              scale = 1.0;
                            });
                          },
                          child: AnimatedContainer(
                            transform: Matrix4.identity()..scale(scale),
                            duration: const Duration(
                                milliseconds:
                                    100), // Corrected the typo in 'microseconds'
                            width: MediaQuery.of(context).size.width < 900
                                ? 200
                                : 400,
                            height: 70,
                            child: Center(
                                child: Text(
                              'Get Started',
                              style: TextStyle(
                                  color: Colors.white,
                                  wordSpacing: 2,
                                  fontSize:
                                      MediaQuery.of(context).size.width < 900
                                          ? 15
                                          : 30,
                                  fontWeight: FontWeight.bold),
                            )),
                            decoration: BoxDecoration(
                                boxShadow: isglowing
                                    ? [
                                        BoxShadow(
                                            color: mycolor.withOpacity(0.6),
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            offset: Offset(-8, 0)),
                                        BoxShadow(
                                            color: mycolor2.withOpacity(0.6),
                                            spreadRadius: 1,
                                            blurRadius: 15,
                                            offset: Offset(8, 0))
                                      ]
                                    : [],
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 0, 150, 181),
                                  Color.fromARGB(255, 89, 109, 115)
                                ]),
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 0, 150, 181)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
