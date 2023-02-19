// import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:elibrary/presentattion/auth/login.dart';
import 'package:elibrary/presentattion/auth/signup.dart';
import 'package:elibrary/presentattion/home/admin_home/admin_home.dart';
import 'package:injectable/injectable.dart';

import '../add_book/add_book.dart';
import '../home/user_home/book_details.dart';
import '../home/user_home/user_home.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  CustomRoute(
    // page: SplashScreen,
    page: LoginPage,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    path: "",
    initial: true,
  ),
  CustomRoute(
    page: SignupPage,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    path: "",
  ),
  CustomRoute(
    page: UserHome,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: AdminHome,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: AddBook,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    page: BookDetails,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  )
])
@LazySingleton()
class $AppRouter {}
