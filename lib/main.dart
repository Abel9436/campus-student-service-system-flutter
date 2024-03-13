import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:servisify/firebase_options.dart';
import 'package:servisify/landing.dart';
import 'package:servisify/main2.dart';
import 'package:servisify/pages/loginn.dart';

import 'package:servisify/pages/serviece_provider_page/login.dart';
import 'package:servisify/pages/serviece_provider_page/signup.dart';
import 'package:servisify/pages/serviece_provider_page/upload_food.dart';
import 'package:servisify/pages/signup.dart';
import 'package:servisify/pages/student_pages/Forgetpassword.dart';
import 'package:servisify/pages/student_pages/email_verification.dart';
import 'package:servisify/pages/student_pages/laundary_serviece.dart';
import 'package:servisify/pages/student_pages/side_hussle.dart';
import 'package:servisify/pages/student_pages/student_food_dash_board.dart';
import 'package:servisify/pages/student_pages/user_profile.dart';
import 'package:servisify/pages/student_pages/userhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Main()),
      initialRoute: '/',
      routes: {
        '/login': (context) => const Login(),
        '/admin': (context) => MainPage(),
        '/profile': (context) => const UserProfile(),
        '/landing': (context) => const Landing(),
        '/signup': (context) => const Signup(),
        '/food': (context) => const FoodDelivary(),
        '/Laundary': (context) => const LaundaryServiece(),
        '/sidehustle': (context) => const SideHustles(),
        '/verify': (context) => const EmailVerificationScreen(),
        '/forget': (context) => const FOrgotpass(),
        '/plogin': (context) => const ProviderLogin(),
        '/psignup': (context) => const providerSignup(),
      },
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const EmailVerificationScreen();
          } else {
            return const Landing();
          }
        },
      ),
    );
  }
}
