import 'package:flutter/material.dart';
import 'package:ecommerce/views/view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => HomePage(
                    data: args,
                  ));
        }
        return _errorRoute();
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupPage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
