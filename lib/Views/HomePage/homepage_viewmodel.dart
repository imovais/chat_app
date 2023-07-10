import 'package:stacked/stacked.dart';
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:chat_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePageViewModel extends BaseViewModel {
  final FirebaseAuthChatApp _firebaseAuthChatApp =
      locator<FirebaseAuthChatApp>();
  NavigationService navigationService = locator<NavigationService>();

  getCountValue() => _firebaseAuthChatApp;

  navigateToLoginPage() {
    navigationService.navigateToLoginPageView();
  }

  getSignOut() =>
      _firebaseAuthChatApp.signOut().then((value) => navigateToLoginPage());
}
