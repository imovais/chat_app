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
            title: const Text('Login',
                style: TextStyle(fontSize: 40, color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => viewModel.gotoGoogleMap(),
                  icon: const Icon(
                    Icons.home,
                    color: Colors.grey,
                  ))
            ],
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              // const Text(
              //   'Login',
              //   style: TextStyle(fontSize: 40),
              // ),
              Image.asset(
                  width: MediaQuery.of(context).size.width * 0.7,
                  'assets/images/vectorlogin.png'),
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
