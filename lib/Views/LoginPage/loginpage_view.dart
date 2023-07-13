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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => viewModel.gotohome(),
                  icon: const Icon(
                    Icons.home,
                    color: Colors.grey,
                  ))
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
