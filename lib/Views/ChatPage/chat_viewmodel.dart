
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/Services/firebase_service.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatPageViewModel extends BaseViewModel {
  final FirebaseAuthChatApp _firebaseAuthChatApp =
      locator<FirebaseAuthChatApp>();
  final FirebaseService _firebaseService = locator<FirebaseService>();
  NavigationService navigationService = locator<NavigationService>();

}
