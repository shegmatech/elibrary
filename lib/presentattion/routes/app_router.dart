// import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:elibrary/presentattion/auth/login.dart';
import 'package:elibrary/presentattion/auth/signup.dart';
import 'package:injectable/injectable.dart';

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
  )
])
@LazySingleton()
class $AppRouter {}
