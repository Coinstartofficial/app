import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:flutter/material.dart';

///author: lty
////Time: 2023/01/13
////Description:
class AppIcons {
  static const String coinstart_logo_white = 'assets/images/coinstart_logo_white.png';
  static const String welcome_logo = 'assets/images/welcome_logo.png';
  static const String welcome_line = 'assets/images/welcome_line.png';
  static const String register_done = 'assets/images/register_done.png';
}

class AppColors {
  static const Color color_a299aa = Color(0xffa299aa);
  static const Color color_ffffff = Color(0xffffffff);
  static const Color color_212937 = Color(0xff212937);
  static const Color color_ac8af8 = Color(0xffac8af8);
}

class Themes {
  static get defaultTheme => ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(textBaseline: TextBaseline.alphabetic),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 13),
        ),
        fontFamily: 'AliPuHuiTi',
        cardColor: APP_MainBGColor, //为了弹窗
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        canvasColor: APP_MainBGColor, //页面背景色
        appBarTheme: const AppBarTheme(
          color: APP_MainBGColor,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 18, color: Colors.white),
          titleTextStyle: TextStyle(fontFamily: 'AliPuHuiTi', color: Colors.white, fontSize: 16),
        ),
      );
}
