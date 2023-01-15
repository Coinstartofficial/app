import 'package:coinstart_wallet_extension/ui/home/home_binding.dart';
import 'package:coinstart_wallet_extension/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:
class HomeTabRouter extends StatelessWidget {
  static const navigatorIndex = 1000;

  const HomeTabRouter({super.key});

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
        page: () => const HomePage(),
        binding: HomeBinding(),
      );
    }

    throw Exception('没有页面');
  }
}
