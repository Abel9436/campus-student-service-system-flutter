import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String error_text = '';
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();

  void signup(String fullname, String email, String password,
      String confirm_password) async {
    if (fullname.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        password == confirm_password) {
      try {
        CollectionReference Users =
            FirebaseFirestore.instance.collection('User');
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );

        await Users.add({
          'Fullname': fullname.trim(),
          'Email': email.trim(),
        });

        print('Added');
        Navigator.pushNamed(context, '/verify');
      } catch (e) {
        print("Error during signup: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 3.5,
        right: MediaQuery.of(context).size.width / 3.5,
        top: MediaQuery.of(context).size.width / 40,
        bottom: MediaQuery.of(context).size.width / 100,
      ),
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 45, 44, 44),
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
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width / 50,
                  right: MediaQuery.of(context).size.width / 20,
                  left: MediaQuery.of(context).size.width / 20,
                  bottom: MediaQuery.of(context).size.width / 100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage('assets/logo.png'),
                      height: MediaQuery.of(context).size.width / 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    Text(
                      'S I G N U P',
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
                      controller: fullname,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.man_2_outlined,
                          color: Colors.white,
                        ),
                        filled: true,
                        hintText: 'Enter your Full Name',
                        fillColor: Color.fromARGB(255, 124, 122, 122),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    TextField(
                      controller: password,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility, color: Colors.white),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        hintText: 'Enter your Password',
                        filled: true,
                        fillColor: Color.fromARGB(255, 124, 122, 122),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    TextField(
                      controller: confirm_password,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility, color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        filled: true,
                        hintText: 'Confirm Your Password',
                        fillColor: Color.fromARGB(255, 124, 122, 122),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        signup(
                          fullname.text,
                          email.text,
                          password.text,
                          confirm_password.text,
                        );
                      },
                      child: Container(
                        width: 800,
                        child: Center(
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 90,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        height: MediaQuery.of(context).size.width / 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 0, 150, 181),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'Already have an Account ?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 100,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/psignup');
                          },
                          child: Text(
                            'I am a serviece Provider',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 100,
                              fontWeight: FontWeight.normal,
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
      ),
    );
  }
}
