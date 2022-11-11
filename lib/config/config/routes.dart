

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/features/login/presentation/login.dart';
import '../../features/features/register/presentation/views/register.dart';

class AppRoutes {
  static const login_route = "/";

  static const register_route = "/register";
}

class AppGenerateRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.login_route:
        return MaterialPageRoute(builder: (context) => Login());
      case AppRoutes.register_route:
        return MaterialPageRoute(builder: (context) => RegesterScreen());
      default:
        return undefienedRoute();
    }
  }

  static Route<dynamic> undefienedRoute() {
    return MaterialPageRoute(builder: (context) =>
        Scaffold(body: Center(child: Text("undifiend page"),),));
  }
}
