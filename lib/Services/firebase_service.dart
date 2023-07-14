import 'dart:async';

import 'package:chat_app/Models/msgmodel.dart';
import 'package:chat_app/Models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirebaseService {
  final CollectionReference usercollectionRef =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference msgcollectionRef =
      FirebaseFirestore.instance.collection('msgs');

  final StreamController<List<MessagesModel>> _chatMessagesController =
      StreamController.broadcast();

  Future createUser(UserModel user) async {
    try {
      usercollectionRef.doc(user.id).set(user.tojson());
    } catch (e) {
      // ignore: avoid_print
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

  Future createMsg(MessagesModel message) async {
    try {
      msgcollectionRef.doc().set(message.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Stream listenToMessagesRealTime(String friendId, String currentUserId) {
    // Register the handler for when the posts data changes
    _requestMessages(friendId, currentUserId);

    return _chatMessagesController.stream;
  }

   void _requestMessages(String friendId, String currentUserId) {
    var messagesQuerySnapshot =
        msgcollectionRef.orderBy('createdAt', descending: true);

    messagesQuerySnapshot.snapshots().listen((messageSnapshot) {
      if (messageSnapshot.docs.isNotEmpty) {
        var messages = messageSnapshot.docs
            .map((ee) => MessagesModel.fromMap(ee.data()! as Map<String, dynamic>))
            .where((element) =>
                (element?.receiverId == friendId &&
                    element?.senderId == currentUserId) ||
                (element?.receiverId == currentUserId &&
                    element?.senderId == friendId))
            .toList(); 
            _chatMessagesController.add(messages.whereType<MessagesModel>().toList());
      }
      
    });
  }
    Future allchatlistHistory(String currentUserId) async {
    var data = await msgcollectionRef.get();
    if (data.docs.isNotEmpty) {
      var msglisthistory = data.docs
          .map(
              (message) => MessagesModel.fromMap(message.data()! as Map<String, dynamic>))
          .where((element) =>
                (element?.receiverId == currentUserId ||
                element?.senderId == currentUserId))
            .toList();
      return msglisthistory;
    }
  }
}
