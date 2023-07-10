// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/Models/usermodel.dart' as _i7;
import 'package:chat_app/Views/ChatPage/chat_view.dart' as _i3;
import 'package:chat_app/Views/GoogleMap/googlemap_view.dart' as _i4;
import 'package:chat_app/Views/HomePage/homepage_view.dart' as _i5;
import 'package:chat_app/Views/LoginPage/loginpage_view.dart' as _i2;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const loginPageView = '/login-page-view';

  static const chatPageView = '/chat-page-view';

  static const googleMapView = '/google-map-view';

  static const homePageView = '/home-page-view';

  static const all = <String>{
    loginPageView,
    chatPageView,
    googleMapView,
    homePageView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginPageView,
      page: _i2.LoginPageView,
    ),
    _i1.RouteDef(
      Routes.chatPageView,
      page: _i3.ChatPageView,
    ),
    _i1.RouteDef(
      Routes.googleMapView,
      page: _i4.GoogleMapView,
    ),
    _i1.RouteDef(
      Routes.homePageView,
      page: _i5.HomePageView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginPageView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginPageView(),
        settings: data,
      );
    },
    _i3.ChatPageView: (data) {
      final args = data.getArgs<ChatPageViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.ChatPageView(key: args.key, friend: args.friend),
        settings: data,
      );
    },
    _i4.GoogleMapView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.GoogleMapView(),
        settings: data,
      );
    },
    _i5.HomePageView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.HomePageView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ChatPageViewArguments {
  const ChatPageViewArguments({
    this.key,
    required this.friend,
  });

  final _i6.Key? key;

  final _i7.UserModel friend;

  @override
  String toString() {
    return '{"key": "$key", "friend": "$friend"}';
  }

  @override
  bool operator ==(covariant ChatPageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.friend == friend;
  }

  @override
  int get hashCode {
    return key.hashCode ^ friend.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToLoginPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatPageView({
    _i6.Key? key,
    required _i7.UserModel friend,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatPageView,
        arguments: ChatPageViewArguments(key: key, friend: friend),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGoogleMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.googleMapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomePageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homePageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatPageView({
    _i6.Key? key,
    required _i7.UserModel friend,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatPageView,
        arguments: ChatPageViewArguments(key: key, friend: friend),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGoogleMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.googleMapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomePageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homePageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
