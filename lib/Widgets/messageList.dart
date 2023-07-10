import 'package:chat_app/Models/msgmodel.dart';
import 'package:chat_app/Widgets/chatBubbles.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    Key? key,
    required this.messages,
    required this.friendId,
  }) : super(key: key);

  final List<MessagesModel> messages;
  final String friendId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (ctx, idx) {
        bool isSent = messages[idx].senderId != friendId;
        return ChatBubble(
          isSent: isSent,
          message: messages[idx].messageBody,
        );
      },
    );
  }
}
