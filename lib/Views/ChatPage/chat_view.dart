import 'package:chat_app/Models/usermodel.dart';
import 'package:chat_app/Views/ChatPage/chat_viewmodel.dart';
import 'package:chat_app/Widgets/messageList.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key, required this.friend});

  final UserModel friend;

  @override
  Widget build(BuildContext context) {
    // Widget buildChatMessages(model, friendId) {
    //   if (model.isBusy) {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   } else {
    //     if (model.messages.length == 0) {
    //       return Expanded(
    //         child: Center(
    //           child: Image.asset('assets/images/empty_inbox.jpg', height: 200),
    //         ),
    //       );
    //     }

    //     return MessagesList(messages: model.messages, friendId: friend.id);
    //   }
    // }
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) =>
            viewModel.listenToMessage(friendId: friend.id),
        viewModelBuilder: () => ChatPageViewModel(),
        builder: (context, viewModel, child) {
          print(viewModel.message.length);
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        friend.username.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        friend.email.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )),
              body: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/whatsapp_Back.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Flexible(
                          child: MessagesList(
                              messages: viewModel.message,
                              friendId: friend.id)),
                      Row(children: <Widget>[
                        Flexible(
                            child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 8.0),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(primaryColor: Colors.white),
                            child: TextField(
                              controller: viewModel.msgcontroller,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.insert_emoticon,
                                    color: Colors.grey),
                                hintText: "Type a message",
                                suffixIcon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                        )),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.teal),
                          child: IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (viewModel.msgcontroller.text.isEmpty) {
                                return print('Contriller is Empty');
                              }
                              viewModel.sendMessage(
                                  viewModel.msgcontroller.text, friend);
                              print('controller has data');
                              viewModel.msgcontroller.clear();
                            },
                          ),
                        )
                      ])
                    ],
                  )));
        });
  }
}
