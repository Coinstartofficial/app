// ignore_for_file: constant_identifier_names

import 'package:coinstart_wallet_extension/ui/login/import/import_binding.dart';
import 'package:coinstart_wallet_extension/ui/login/import/import_page.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/setup_binding.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/setup_page.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SETUP;

  static final routes = [
    GetPage(
      name: Routes.SETUP,
      page: () => const SetUpPage(),
      binding: SetUpBinding(),
    ),
    GetPage(
      name: Routes.IMPORT,
      page: () => const ImportPage(),
      binding: ImportBinding(),
    ),
  ];
}
