import 'package:chat_app/Views/ChatPage/chat_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:chat_app/Services/firebase_authentication.dart';
import 'package:chat_app/Views/HomePage/homepage_view.dart';
import 'package:chat_app/Views/LoginPage/loginpage_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../Services/firebase_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginPageView),
  MaterialRoute(page: ChatPageView),
  MaterialRoute(
    page: HomePageView,
  ),
], dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: FirebaseAuthChatApp),
  LazySingleton(classType: FirebaseService)
])
class App {}
