import 'package:coinstart_wallet_extension/api/sui_api.dart';
import 'package:coinstart_wallet_extension/controller/sui_wallet_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SuiApi>(SuiApi(), permanent: true);
    Get.put<SuiWalletController>(SuiWalletController(), permanent: true);
  }
}
