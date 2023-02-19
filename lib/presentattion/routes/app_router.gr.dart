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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../infrastructure/auth/models/book_model.dart' as _i9;
import '../add_book/add_book.dart' as _i5;
import '../auth/login.dart' as _i1;
import '../auth/signup.dart' as _i2;
import '../home/admin_home/admin_home.dart' as _i4;
import '../home/user_home/book_details.dart' as _i6;
import '../home/user_home/user_home.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignupRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.SignupPage(),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserHome.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.UserHome(),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminHome.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminHome(),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddBook.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AddBook(),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BookDetails.name: (routeData) {
      final args = routeData.argsAs<BookDetailsArgs>();
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.BookDetails(
          key: args.key,
          book: args.book,
          isAdmin: args.isAdmin,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '',
        ),
        _i7.RouteConfig(
          SignupRoute.name,
          path: '',
        ),
        _i7.RouteConfig(
          UserHome.name,
          path: '/user-home',
        ),
        _i7.RouteConfig(
          AdminHome.name,
          path: '/admin-home',
        ),
        _i7.RouteConfig(
          AddBook.name,
          path: '/add-book',
        ),
        _i7.RouteConfig(
          BookDetails.name,
          path: '/book-details',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SignupPage]
class SignupRoute extends _i7.PageRouteInfo<void> {
  const SignupRoute()
      : super(
          SignupRoute.name,
          path: '',
        );

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i3.UserHome]
class UserHome extends _i7.PageRouteInfo<void> {
  const UserHome()
      : super(
          UserHome.name,
          path: '/user-home',
        );

  static const String name = 'UserHome';
}

/// generated route for
/// [_i4.AdminHome]
class AdminHome extends _i7.PageRouteInfo<void> {
  const AdminHome()
      : super(
          AdminHome.name,
          path: '/admin-home',
        );

  static const String name = 'AdminHome';
}

/// generated route for
/// [_i5.AddBook]
class AddBook extends _i7.PageRouteInfo<void> {
  const AddBook()
      : super(
          AddBook.name,
          path: '/add-book',
        );

  static const String name = 'AddBook';
}

/// generated route for
/// [_i6.BookDetails]
class BookDetails extends _i7.PageRouteInfo<BookDetailsArgs> {
  BookDetails({
    _i8.Key? key,
    required _i9.BookModel book,
    required bool isAdmin,
  }) : super(
          BookDetails.name,
          path: '/book-details',
          args: BookDetailsArgs(
            key: key,
            book: book,
            isAdmin: isAdmin,
          ),
        );

  static const String name = 'BookDetails';
}

class BookDetailsArgs {
  const BookDetailsArgs({
    this.key,
    required this.book,
    required this.isAdmin,
  });

  final _i8.Key? key;

  final _i9.BookModel book;

  final bool isAdmin;

  @override
  String toString() {
    return 'BookDetailsArgs{key: $key, book: $book, isAdmin: $isAdmin}';
  }
}
