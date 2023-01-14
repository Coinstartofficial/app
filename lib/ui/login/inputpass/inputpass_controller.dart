import 'package:coinstart_wallet_extension/controller/sui_wallet_controller.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/14
////Description:

class InputPassController extends GetxController {
  var inputState = false.obs;
  var firstPwd = ''.obs;
  var secondPwd = ''.obs;
  dynamic mnemonic;

  @override
  void onInit() {
    var arguments = Get.arguments;
    mnemonic = arguments['mnemonic'];
    super.onInit();
  }

  void addWalletToLocal() {
    SuiWalletController suiWallet = Get.find();
    suiWallet.addWallet(mnemonic, secondPwd.value * 2);
  }
}
