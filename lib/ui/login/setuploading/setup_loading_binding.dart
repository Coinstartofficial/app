import 'package:coinstart_wallet_extension/ui/login/setuploading/setup_loading_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/14
////Description:

class SetUpLoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetUpLoadingController>(
      () => SetUpLoadingController(),
      fenix: true,
    );
  }
}
