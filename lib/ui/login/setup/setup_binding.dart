import 'package:coinstart_wallet_extension/ui/login/setup/setup_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:
class SetUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetUpController>(
      () => SetUpController(),
      fenix: true,
    );
  }
}
