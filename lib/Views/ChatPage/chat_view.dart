import 'package:chat_app/Views/ChatPage/chat_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ChatPageViewModel(),
        builder: (context, viewModel, child) {
          return const Center(child: Text('Chat View'));
        });
  }
}
