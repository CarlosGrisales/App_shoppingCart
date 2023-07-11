import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginGoogleUtils {
  static const String TAG = "loginGoogleUtils";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSingIn = GoogleSignIn();
  //google methods
  //signInWhitGoogle
  Future<User> signInWithGoogle() async {
    log(TAG + ", signInWithGoogle() init...");
    throw Exception('Ocurrió un error');
  }
}
