import 'package:coinstart_wallet_extension/ui/login/recoveryphrase/recovery_phrase_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:
class RecoveryPhraseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoveryPhraseController>(
      () => RecoveryPhraseController(),
      fenix: true,
    );
  }
}
