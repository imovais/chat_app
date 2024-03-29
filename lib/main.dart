import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/Views/GoogleMap/googlemap_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuthChatApp().currentuser == null
          ? Routes.loginPageView : Routes.googleMapView,
          // : Routes.homePageView,
          
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
