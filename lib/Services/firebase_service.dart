import 'package:chat_app/Models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final CollectionReference usercollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel user) async {
    try {
      usercollectionRef.doc(user.id).set(user.tojson());
    } catch (e) {
      print(e);
    }
  }

  Future allusers(String currentuser) async {
    var data = await usercollectionRef.get();
    if (data.docs.isNotEmpty) {
      var userlist = data.docs
          .map(
              (user) => UserModel.fromMap(user.data()! as Map<String, dynamic>))
          .where((user) => user.id != currentuser)
          .toList();
      return userlist;
    }
  }
}
