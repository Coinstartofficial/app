import 'package:coinstart_wallet_extension/ui/login/inputpass/inputpass_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/14
////Description:

class InputPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputPassController>(
      () => InputPassController(),
      fenix: true,
    );
  }
}
