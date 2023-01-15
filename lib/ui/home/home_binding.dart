import 'package:coinstart_wallet_extension/ui/home/home_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
