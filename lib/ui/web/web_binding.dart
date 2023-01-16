import 'package:coinstart_wallet_extension/ui/web/web_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/16
////Description:

class WebBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebController>(
      () => WebController(),
      fenix: true,
    );
  }
}
