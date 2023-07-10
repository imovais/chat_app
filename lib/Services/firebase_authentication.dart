import 'package:chat_app/Models/usermodel.dart';
import 'package:chat_app/Services/firebase_service.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthChatApp {
  late UserModel _currentUser;
  UserModel get currentuser => _currentUser;
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
    _firebaseFirestore.createUser(_currentUser);
    return data.user != null;
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    print('Sign Out Sucessfully');
  }
}
