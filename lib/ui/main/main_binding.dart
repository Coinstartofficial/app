import 'package:coinstart_wallet_extension/ui/main/main_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
  }
}
