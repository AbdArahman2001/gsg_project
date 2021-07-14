import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static final AppRouter appRouter = AppRouter._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
 AppRouter.navigatePage(Widget widget){
   navKey.currentState.push(MaterialPageRoute(builder: (ctx)=> widget));
 }
 AppRouter.navigateNamedPage(String route,var args){
   navKey.currentState.pushNamed(route,arguments: args);
 }


}
