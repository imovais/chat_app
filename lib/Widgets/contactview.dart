import 'package:chat_app/Views/HomePage/homepage_viewmodel.dart';
import 'package:chat_app/Widgets/chat_list.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key, required this.viewModel});

  final HomePageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(Icons.link),
            ),
            title: Text('Create call link'),
            subtitle: Text('Share a link for your WhatsApp call')),
        Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text('Recent')),
        Expanded(
          child: FutureBuilder(
            future: viewModel.getalluser(),
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
