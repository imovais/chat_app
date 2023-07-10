import 'package:chat_app/Models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
