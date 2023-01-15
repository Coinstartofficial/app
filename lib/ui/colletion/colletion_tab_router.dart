import 'package:coinstart_wallet_extension/ui/colletion/colletion_binding.dart';
import 'package:coinstart_wallet_extension/ui/colletion/colletion_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:

class ColletionTabRouter extends StatelessWidget {
  static const navigatorIndex = 2000;

  const ColletionTabRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: onGenerateRouter,
    );
  }

  static Route onGenerateRouter(RouteSettings settings) {
    debugPrint("ColletionTabRouter ${settings.name}");
    if (settings.name == '/') {
      return GetPageRoute(
        settings: settings,
        page: () => const ColletionPage(),
        binding: ColletionBinding(),
      );
    }

    throw Exception('没有页面');
  }
}
