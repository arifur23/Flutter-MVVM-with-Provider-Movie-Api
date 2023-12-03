import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider_api/main.dart';
import 'package:flutter_mvvm_provider_api/utils/routes/routes_names.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch ( settings.name){
      case RouteName.splash :
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'title'));
      case RouteName.home :
        return MaterialPageRoute(builder: (_) => const MyHomePage(title: 'title'));
      default :
        return MaterialPageRoute(builder: (_) =>
        const Scaffold(
          body: Center(child: Text('No Route Defined'),),
        ));
    }
  }
}