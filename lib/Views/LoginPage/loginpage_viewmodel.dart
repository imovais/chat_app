import 'package:stacked/stacked.dart';
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginPageViewModel extends BaseViewModel {
  final FirebaseAuthChatApp _firebaseAuthChatApp =
      locator<FirebaseAuthChatApp>();
  NavigationService navigationService = locator<NavigationService>();

  getfirebaseAuth() => _firebaseAuthChatApp.signinwithgoogle();
}
