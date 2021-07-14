import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsg_first_project/lib2/distanation.dart';
import 'package:gsg_first_project/lib2/router.dart';
import 'form_ui.dart';

main() {
  runApp(MaterialApp(
    navigatorKey: AppRouter.appRouter.navKey,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (RouteSettings routeSettings) {
      String name = routeSettings.name;
      var args = routeSettings.arguments;
      if (name == '/') {
        return MaterialPageRoute(builder: (ctx) => FormUI());
      }
      else if (name == 'dest') {
        return MaterialPageRoute(builder: (ctx) => Destination(args));
      } else {
        return MaterialPageRoute(builder: (ctx) =>
            Scaffold(body: Center(child: Text('Error: Page not found'),),));
      }
    },


  ),
  );
}
