import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/app/app.locator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GoogleMapViewModel extends BaseViewModel {
  // FIREBASE AUTH SERVICE INSTANCE
  final FirebaseAuthChatApp _firebaseAuthChatApp =
      locator<FirebaseAuthChatApp>();
  // NAVIGATION SERVICE INSTANCE
  NavigationService navigationService = locator<NavigationService>();

  static const CameraPosition _kGooglePlex = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414);

//========GETTER FUNCTIONS=========

  getKGooglePlex() => _kGooglePlex;
}
