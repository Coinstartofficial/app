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
  static const String setup_rectangle = 'assets/images/setup_rectangle.png';

  static const String tab_coin_after = 'assets/images/tab_coin_after.png';
  static const String tab_coin_before = 'assets/images/tab_coin_before.png';

  static const String tab_dapp_after = 'assets/images/tab_dapp_after.png';
  static const String tab_dapp_before = 'assets/images/tab_dapp_before.png';

  static const String tab_swap_after = 'assets/images/tab_swap_after.png';
  static const String tab_swap_before = 'assets/images/tab_swap_before.png';

  static const String tab_nft_after = 'assets/images/tab_nft_after.png';
  static const String tab_nft_before = 'assets/images/tab_nft_before.png';

  static const String tab_discover_after = 'assets/images/tab_discover_after.png';
  static const String tab_discover_before = 'assets/images/tab_discover_before.png';

  static const String coinstart_logo = 'assets/images/coinstart_logo.png';
  static const String wallet_online = 'assets/images/wallet_online.webp';
  static const String link_wallet_button_icon = 'assets/images/link_wallet_button_icon.png';
  static const String copy = 'assets/images/copy.png';

  static const String ETH = 'assets/icons/crypto/ETH.png';
}

class AppColors {
  static const Color color_a299aa = Color(0xffa299aa);
  static const Color color_ffffff = Color(0xffffffff);
  static const Color color_40ffffff = Color(0xff40ffffff);
  static const Color color_06ffffff = Color(0xff06ffffff);
  static const Color color_212937 = Color(0xff212937);
  static const Color color_ac8af8 = Color(0xffac8af8);
  static const Color color_6c6771 = Color(0xff6c6771);
  static const Color color_a679e0 = Color(0xffa679e0);
  static const Color color_485162 = Color(0xff485162);
  static const Color color_9c56f6 = Color(0xff9c56f6);
  static const Color color_606266 = Color(0xff606266);
  static const Color color_212124 = Color(0xff212124);
  static const Color color_30000000 = Color(0xff30000000);
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
