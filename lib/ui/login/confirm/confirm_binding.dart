import 'package:coinstart_wallet_extension/ui/login/confirm/confirm_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class ConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmController>(
      () => ConfirmController(),
      fenix: true,
    );
  }
}
