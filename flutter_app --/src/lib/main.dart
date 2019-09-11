import 'package:flutter/material.dart';
import 'ui/login.dart';




void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,

    builder: (context, child) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: child,
      );

  },

home: Login(),
  ));
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {

    return child;
  }
}
