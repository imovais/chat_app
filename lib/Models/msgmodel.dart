import 'package:chat_app/Models/usermodel.dart';

class MessagesModel {
  UserModel sender;
  UserModel receiver;

  // String receiverId;
  // String senderId;
  // String senderName;
  // String receiverName;
  String messageBody;
  int createdAt;

  MessagesModel({
    // required this.receiverId,
    // required this.senderId,
    required this.sender,
    required this.receiver,
    required this.messageBody,
    required this.createdAt,
    // required this.senderName,
    // required this.receiverName,
  });

  MessagesModel.fromData(Map<String, dynamic> data)
      : sender = UserModel.fromMap(data['sender']),
        receiver = UserModel.fromMap(data['receiver']),
        messageBody = data['messageBody'],
        createdAt = data['createdAt'];

  static MessagesModel? fromMap(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) return null;

    return MessagesModel(
      sender: UserModel.fromMap(map['sender']),
      receiver: UserModel.fromMap(map['receiver']),
      messageBody: map['messageBody'],
      createdAt: map['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': sender.tojson(),
      'receiver': receiver.tojson(),
      'messageBody': messageBody,
      'createdAt': createdAt,
    };
  }
}
