import 'package:chat_app/Services/firebase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:chat_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePageViewModel extends BaseViewModel {
  final FirebaseAuthChatApp _firebaseAuthChatApp =
      locator<FirebaseAuthChatApp>();
  final FirebaseService _firebaseService = locator<FirebaseService>();
  NavigationService navigationService = locator<NavigationService>();

  getCountValue() => _firebaseAuthChatApp;

  navigateToLoginPage() {
    navigationService.navigateToLoginPageView();
  }

  getSignOut(context) => _firebaseAuthChatApp
      .signOut(context: context)
      .then((value) => navigateToLoginPage());

  getcurrentuser() => _firebaseAuthChatApp.currentuser?.username;
  getalluser() => _firebaseService
      .allusers(_firebaseAuthChatApp.currentuser!.id.toString());
}
