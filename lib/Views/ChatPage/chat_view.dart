import 'package:chat_app/Models/usermodel.dart';
import 'package:chat_app/Views/ChatPage/chat_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key, required this.friend});

  final UserModel friend;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ChatPageViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(friend.username.toString()),
              ),
              body: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/whatsapp_Back.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Flexible(
                          child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return const Center(child: Text('hello'));
                        },
                      )),
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
                                  viewModel.msgcontroller.text,
                                  friend.username.toString(),
                                  friend.id.toString());
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
