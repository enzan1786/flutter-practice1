import 'package:flutter/material.dart';
import 'package:practice1/CustomRouter/CustomRouter.dart';
import 'package:practice1/screen/Webview/WebViewCustom.dart';
import 'package:practice1/screen/pages/about.dart';
import 'package:practice1/screen/pages/home.dart';
import 'package:practice1/screen/pages/setting.dart';
import 'package:practice1/screen/pages/not_found.dart';
import 'package:practice1/CustomRouter/Router_Constant.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
