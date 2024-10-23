import 'package:bankdki_test/feature/home/presentation/page/home_page.dart';
import 'package:bankdki_test/feature/login/presentation/page/login_page.dart';
import 'package:bankdki_test/feature/opening/presentation/page/opening_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String openingPage = '/';
  static const String loginPage = '/login';
  static const String homePage = '/home';
}

// Map<String, Widget Function(BuildContext)> appRoutes = {
//   Routes.moviePage: (context) => const MoviePage(),
// };

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.openingPage:
      return MaterialPageRoute(
        builder: (BuildContext context) => OpeningPage(
          data: settings.arguments,
        ),
        settings: settings,
      );
    case Routes.loginPage:
      return MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(
          data: settings.arguments,
        ),
        settings: settings,
      );
    case Routes.homePage:
      return MaterialPageRoute(
        builder: (BuildContext context) => HomePage(
          data: settings.arguments,
        ),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => const Scaffold(
          body: Center(
            child: Text('Route not defined'),
          ),
        ),
        settings: settings,
      );
  }
}
