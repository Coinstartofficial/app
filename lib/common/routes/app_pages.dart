// ignore_for_file: constant_identifier_names

import 'package:coinstart_wallet_extension/ui/login/confirm/confirm_binding.dart';
import 'package:coinstart_wallet_extension/ui/login/confirm/confirm_page.dart';
import 'package:coinstart_wallet_extension/ui/login/import/import_binding.dart';
import 'package:coinstart_wallet_extension/ui/login/import/import_page.dart';
import 'package:coinstart_wallet_extension/ui/login/inputpass/inputpass_binding.dart';
import 'package:coinstart_wallet_extension/ui/login/inputpass/inputpass_page.dart';
import 'package:coinstart_wallet_extension/ui/login/recoveryphrase/recovery_phrase_binding.dart';
import 'package:coinstart_wallet_extension/ui/login/recoveryphrase/recovery_phrase_page.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/setup_page.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/setup_result.dart';
import 'package:coinstart_wallet_extension/ui/login/setuploading/setup_loading_binding.dart';
import 'package:coinstart_wallet_extension/ui/login/setuploading/setup_loading_page.dart';
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
    ),
    GetPage(
      name: Routes.SETUP_LOADING,
      page: () => const SetUpLoadingPage(),
      binding: SetUpLoadingBinding(),
    ),
    GetPage(
      name: Routes.SETUP_RESULT,
      page: () => const SetUpResult(),
    ),
    GetPage(
      name: Routes.RECOVERY_PHRASE,
      page: () => const RecoveryPhrasePage(),
      binding: RecoveryPhraseBinding(),
    ),
    GetPage(
      name: Routes.IMPORT,
      page: () => const ImportPage(),
      binding: ImportBinding(),
    ),
    GetPage(
      name: Routes.CONFIRM,
      page: () => const ConfirmPage(),
      binding: ConfirmBinding(),
    ),
    GetPage(
      name: Routes.INPUT_PASS,
      page: () => const InputPassPage(),
      binding: InputPassBinding(),
    ),
  ];
}
