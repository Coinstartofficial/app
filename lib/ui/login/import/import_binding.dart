import 'package:coinstart_wallet_extension/ui/login/import/import_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class ImportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportController>(
      () => ImportController(),
      fenix: true,
    );
  }
}
