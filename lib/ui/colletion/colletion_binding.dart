import 'package:coinstart_wallet_extension/ui/colletion/colletion_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:

class ColletionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ColletionController>(() => ColletionController());
  }
}
