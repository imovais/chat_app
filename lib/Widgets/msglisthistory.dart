import 'package:chat_app/Models/msgmodel.dart';
import 'package:chat_app/Models/usermodel.dart';
import 'package:chat_app/Views/HomePage/homepage_viewmodel.dart';
import 'package:chat_app/Widgets/chat_list.dart';
import 'package:flutter/material.dart';

class MsgListHistory extends StatelessWidget {
  const MsgListHistory({super.key, required this.viewModel});

  final HomePageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: viewModel.getallmsglisthistory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var snap = snapshot.data;
              if (snapshot.hasData) {
                print('has data from ui ${snap.length}');
                return ListView.builder(
                  itemCount: snap.length,
                  itemBuilder: (context, index) {
                    var data = snap[index] as UserModel;

                    return GestureDetector(
                        onTap: () {
                          viewModel.gotochatview(data as UserModel);
                          // print(data.username);
                          // print(viewModel.getcurrentuser());
                        },
                        child: whatsapp_chat_list(
                          name: data.username,
                          // viewModel.getcurrentuser() == data.sender.username
                          //     ? data.receiver.username
                          //     : data.sender.username,
                          msg: data.email,
                          //data.messageBody.toString()),
                        ));
                  },
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.teal,
                ));
              }
            },
          ),
        ),
      ],
    );
  }
}
