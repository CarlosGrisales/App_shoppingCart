import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenticator extends StatelessWidget {
  const Authenticator({super.key});
  static Future iniciarSesion({required BuildContext context}) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;

    GoogleSignIn objGoogleSignIn = GoogleSignIn();
    GoogleSignInAccount? objGoogleSignInAccount =
        await objGoogleSignIn.signIn();

    if (objGoogleSignIn != null) {
      GoogleSignInAuthentication? objGoogleSignInAuthentication =
          await objGoogleSignInAccount?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objGoogleSignInAuthentication?.accessToken,
          idToken: objGoogleSignInAuthentication?.idToken);

      try {
        UserCredential userCredential = await
            authenticator.signInWithCredential(credential);
            user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticacion");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
