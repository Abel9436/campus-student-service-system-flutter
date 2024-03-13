import 'package:firebase_auth/firebase_auth.dart';

class Logout {
  void logout(final user) async {
    FirebaseAuth.instance.signOut();
  }
}
