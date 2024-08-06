import 'package:apni_property_app/features/presentation/screens/auth/forget_password_screen.dart';
import 'package:apni_property_app/features/presentation/screens/detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:apni_property_app/configs/routes/routes_name.dart';
import 'package:apni_property_app/features/presentation/screens/auth/login_screen.dart';
import 'package:apni_property_app/features/presentation/screens/auth/sign_up_screen.dart';
import 'package:apni_property_app/features/presentation/screens/get_started/get_started_screen.dart';
import 'package:apni_property_app/features/presentation/screens/home/home_screen.dart';
import 'package:apni_property_app/features/presentation/screens/splash_screen.dart';

import '../../features/presentation/screens/detail/my_purchase_detail_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.getStartedRoute:
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => const GetStartedScreen(),
        );
      case RouteNames.loginRoute:
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
        case RouteNames.forgetPassword:
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(),
        );
      case RouteNames.signUpRoute:
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case RouteNames.homeRoute:
      // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case RouteNames.productDetail:
      // Validation of correct data type
      var arguments = args as ProductDetailScreenArguments;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(data: arguments.data),
        );
      case RouteNames.myPurchaseDetail:
      // Validation of correct data type
        var arguments2 = args as MyPurchaseDetailScreenArguments;
        return MaterialPageRoute(
          builder: (_) => MyPurchaseDetailScreen(data: arguments2.data!, data1: arguments2.data1,),
        );
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
