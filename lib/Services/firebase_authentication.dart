import 'package:chat_app/Models/usermodel.dart';
import 'package:chat_app/Services/firebase_service.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthChatApp {
  static UserModel? _currentUser;
   UserModel? get currentuser => _currentUser;
  final FirebaseService _firebaseFirestore = locator<FirebaseService>();

  Future<bool> signinwithgoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var data = await FirebaseAuth.instance.signInWithCredential(credential);
    _currentUser = UserModel(data.user!.uid, data.user!.displayName.toString(),
        data.user!.email.toString());

    //Create User
    _firebaseFirestore.createUser(_currentUser!);
    return data.user != null;
  }

  //=============GOOGLE SIGNOUT================

  Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        FirebaseAuthChatApp.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
  

  // =======================


  //========SNACK BAR ========
  static SnackBar customSnackBar({required String content}) {
  return SnackBar(
    backgroundColor: Colors.black,
    content: Text(
      content,
      style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
    ),
  );
}
}
