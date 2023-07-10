import 'package:chat_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginPageViewModel extends BaseViewModel {
  //FIREBASE AUTH SERVICE INSTANCE
  final FirebaseAuthChatApp _firebaseAuthChatApp =
      locator<FirebaseAuthChatApp>();
  //NAVIGATION SERVICE INSTANCE
  NavigationService navigationService = locator<NavigationService>();

  gotohome() => navigationService.replaceWithHomePageView();
  gotoGoogleMap() => navigationService.replaceWithGoogleMapView();

// GET METHOD FROM SERVICES
  getfirebaseAuth() =>
      _firebaseAuthChatApp.signinwithgoogle().then((value) => gotohome());

  getSignOut(context) => _firebaseAuthChatApp.signOut(context: context);
}
