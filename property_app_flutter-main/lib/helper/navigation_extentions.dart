import 'package:flutter/material.dart';

extension NavigationPushReplacment on BuildContext {
  void pushReplacement({
    required String routeName,
  }) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }
}
extension NavigationPushName on BuildContext {
  void pushName<T>({
    required String routeName,T? screenArgs
  }) {
    Navigator.of(this).pushNamed(routeName,arguments: screenArgs);
  }
}
extension NavigationPushMakeModelRoute on BuildContext {
  void pushAndModelRoute({
    required Widget nextPage,
    required String routeName
  }) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(builder: (BuildContext context) {
          return nextPage;
        }),
        ModalRoute.withName(routeName) // Replace this with your root screen's route name (usually '/')
    );
  }
}