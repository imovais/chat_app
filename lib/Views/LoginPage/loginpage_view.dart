import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:stacked/stacked.dart';
import 'package:chat_app/Views/LoginPage/loginpage_viewmodel.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginPageViewModel(),
      builder: (context, viewModel, child) {
        print(viewModel.getfirebaseAuth());
        return Scaffold(
          appBar: AppBar(
            title: const Text('LoginPage'),
            actions: [
              IconButton(
                  onPressed: () => viewModel.getSignOut(),
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(Buttons.GoogleDark, onPressed: () {
                viewModel.getfirebaseAuth();
              })
            ],
          )),
        );
      },
    );
  }
}
