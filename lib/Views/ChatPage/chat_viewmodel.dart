import 'package:chat_app/Models/msgmodel.dart';
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/Services/firebase_service.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatPageViewModel extends BaseViewModel {
  final FirebaseAuthChatApp _firebaseAuthChatApp =
      locator<FirebaseAuthChatApp>();
  final FirebaseService _firebaseService = locator<FirebaseService>();
  NavigationService navigationService = locator<NavigationService>();

  final TextEditingController msgcontroller = TextEditingController();

  // Empty Array for Message
  List<MessagesModel> _message = [];
  List<MessagesModel> get message => _message;
  //========================

  Future sendMessage(String msgbody, String receivername, receiverId) async {
    final MessagesModel message = MessagesModel(
        receiverId: receiverId,
        senderId: _firebaseAuthChatApp.currentuser!.id,
        messageBody: msgbody,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        senderName: _firebaseAuthChatApp.currentuser!.username,
        receiverName: receivername);
    await _firebaseService.createMsg(message);

    print('creatinggggg');
  }

  void listenToMessage({required friendId}) {
    _firebaseService
        .listenToMessagesRealTime(
            friendId, _firebaseAuthChatApp.currentuser!.id)
        .listen((messagesdata) {
      List<MessagesModel> updatedMessages = messagesdata;
      if (updatedMessages != null) {
        _message = updatedMessages;
        rebuildUi();
      }
    });
  }
}
