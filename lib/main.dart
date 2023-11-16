import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterassignment/address/address_screen.dart';
import 'package:flutterassignment/constants/colors.dart';
import 'package:flutterassignment/theme/app_theme.dart';

import 'navigation/routes.dart';

void main() {
  const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final router = Navigation().router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        theme: lightThemeData
    );
  }
}
