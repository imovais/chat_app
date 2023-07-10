// ignore_for_file: avoid_print

import 'dart:async';

import 'package:chat_app/Models/msgmodel.dart';
import 'package:chat_app/Models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      //print("MessageModel $message");
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
            .map((ee) =>
                MessagesModel.fromMap(ee.data()! as Map<String, dynamic>))
            .where((element) =>
                (element?.receiver.id == friendId &&
                    element?.sender.id == currentUserId) ||
                (element?.receiver.id == currentUserId &&
                    element?.sender.id == friendId))
            .toList();
        _chatMessagesController
            .add(messages.whereType<MessagesModel>().toList());
      } else {
        return;
      }
    });
  }

  // Future allchatlistHistory(String currentUserId) async {
  //   var data =
  //       await msgcollectionRef.orderBy('createdAt', descending: true).get();

  //   if (data.docs.isNotEmpty) {
  // var msglisthistory = data.docs
  //     .map((message) =>
  //         MessagesModel.fromMap(message.data()! as Map<String, dynamic>))
  //     .where((element) => (element?.receiver.id == currentUserId ||
  //         element?.sender.id == currentUserId))
  //     .toList()
  //     .where((element) =>
  //         element?.sender.id == currentUserId ||
  //         element?.receiver.id == currentUserId)
  //     .toList();

  // print('here ${msglisthistory[0]?.sender.email}');

  // var userdata =

  //   await usercollectionRef.where(currentUserId, isEqualTo: ).orderBy('createdAt', descending: true).get();

  //     return;
  //     //msglisthistory;
  //   }
  // }

  Future allchatlistHistory(String currentUserId) async {
    var msg_data =
        await msgcollectionRef.orderBy('createdAt', descending: false).get();
    var msglisthistory = msg_data.docs
        .map((message) =>
            MessagesModel.fromMap(message.data()! as Map<String, dynamic>))
        .where((element) => (element?.receiver.id == currentUserId ||
            element?.sender.id == currentUserId))
        .toList();
    var user_data = await usercollectionRef.get();
    var userlist = user_data.docs
        .map((user) => UserModel.fromMap(user.data()! as Map<String, dynamic>))
        .where((user) => user.id != currentUserId)
        .toList();
    var finalList = [];
    for (UserModel user in userlist) {
      for (MessagesModel? msg in msglisthistory) {
        if (user.id == msg?.sender.id || user.id == msg?.receiver.id) {
          finalList.add(user);
        }
      }
    }
    return finalList.toSet().toList();
  }
}
