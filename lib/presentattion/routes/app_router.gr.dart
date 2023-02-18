// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../add_book/add_book.dart' as _i5;
import '../auth/login.dart' as _i1;
import '../auth/signup.dart' as _i2;
import '../home/admin_home/admin_home.dart' as _i4;
import '../home/user_home/user_home.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignupRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.SignupPage(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserHome.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.UserHome(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminHome.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminHome(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddBook.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AddBook(),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '',
        ),
        _i6.RouteConfig(
          SignupRoute.name,
          path: '',
        ),
        _i6.RouteConfig(
          UserHome.name,
          path: '/user-home',
        ),
        _i6.RouteConfig(
          AdminHome.name,
          path: '/admin-home',
        ),
        _i6.RouteConfig(
          AddBook.name,
          path: '/add-book',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SignupPage]
class SignupRoute extends _i6.PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i3.UserHome]
class UserHome extends _i6.PageRouteInfo<void> {
  const UserHome()
      : super(
          UserHome.name,
          path: '/user-home',
        );

  static const String name = 'UserHome';
}

/// generated route for
/// [_i4.AdminHome]
class AdminHome extends _i6.PageRouteInfo<void> {
  const AdminHome()
      : super(
          AdminHome.name,
          path: '/admin-home',
        );

  static const String name = 'AdminHome';
}

/// generated route for
/// [_i5.AddBook]
class AddBook extends _i6.PageRouteInfo<void> {
  const AddBook()
      : super(
          AddBook.name,
          path: '/add-book',
        );

  static const String name = 'AddBook';
}
