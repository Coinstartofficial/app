import 'package:coinstart_wallet_extension/ui/web/web_binding.dart';
import 'package:coinstart_wallet_extension/ui/web/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/16
////Description:

class DappTabRouter extends StatelessWidget {
  static const navigatorIndex = 3000;

  const DappTabRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: onGenerateRouter,
    );
  }

  static Route onGenerateRouter(RouteSettings settings) {
    debugPrint("HomeTabRouter ${settings.name}");
    if (settings.name == '/') {
      return GetPageRoute(
        settings: settings,
        page: () => const WebPage(),
        binding: WebBinding(),
      );
    }

    throw Exception('没有页面');
  }
}
