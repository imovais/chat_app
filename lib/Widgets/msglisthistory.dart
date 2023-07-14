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
                return ListView.builder(
                  itemCount: snap.length,
                  itemBuilder: (context, index) {
                    var data = snap[index];
                    return GestureDetector(
                      onTap: () {
                        viewModel.gotochatview(data);
                        print(data.id);
                      },
                      child: whatsapp_chat_list(
                          name: data.username.toString(),
                          msg: data.email.toString()),
                    );
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
