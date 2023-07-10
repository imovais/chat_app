import 'package:stacked/stacked_annotations.dart';
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/Views/HomePage/homepage_view.dart';
import 'package:chat_app/Views/LoginPage/loginpage_view.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginPageView, initial: true),
  MaterialRoute(
    page: HomePageView,
  ),
], dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: FirebaseAuthChatApp)
])
class App {}
