import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderLogin extends StatefulWidget {
  const ProviderLogin({Key? key}) : super(key: key);

  @override
  State<ProviderLogin> createState() => _ProviderLoginState();
}

class _ProviderLoginState extends State<ProviderLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  String errorText = '';
  Future<String> login(String email, String password) async {
    setState(() {
      isLoading = true;
      errorText = '';
    });

    try {
      FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((DocumentSnapshot document) {
          print(document.data());
        });
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushNamed(context, '/verify');
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorText = e.message ?? 'An error occurred';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 3.5,
        right: MediaQuery.of(context).size.width / 3.5,
        top: MediaQuery.of(context).size.width / 15,
        bottom: MediaQuery.of(context).size.width / 100,
      ),
      child: Material(
        // Wrap your content in a Material widget
        color: Colors.transparent, // Specify the color as needed
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 47, 46, 46),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/landing');
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 50,
                    right: MediaQuery.of(context).size.width / 20,
                    left: MediaQuery.of(context).size.width / 20,
                    bottom: MediaQuery.of(context).size.width / 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/logo.png'),
                      height: MediaQuery.of(context).size.width / 15,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 100),
                    Text(
                      'P R O V I D E R L O G I N',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    TextField(
                      controller: email,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          filled: true,
                          hintText: 'Enter your Email',
                          fillColor: Color.fromARGB(255, 124, 122, 122),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    TextField(
                      controller: password,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          suffixIcon:
                              Icon(Icons.visibility, color: Colors.white),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Password',
                          filled: true,
                          fillColor: Color.fromARGB(255, 124, 122, 122),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forget');
                            },
                            child: Text(
                              'Forgote Password ?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width / 100,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          login(email.text.trim(), password.text.trim());
                        });
                      },
                      child: Container(
                        width: 600,
                        child: Center(
                          child: isLoading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white))
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        height: MediaQuery.of(context).size.width / 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 0, 150, 181)),
                      ),
                    ),
                    Text(errorText, style: TextStyle(color: Colors.red)),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Don\'t You have an Account ?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width / 100,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/plogin');
                            },
                            child: Text(
                              'I am serviece provider',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width / 100,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
