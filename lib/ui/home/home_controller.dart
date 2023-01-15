import 'package:coinstart_wallet_extension/main.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:

class HomeController extends GetxController {
  var ethaddress = ''.obs;
  @override
  void onInit() {
    super.onInit();
    ethaddress.value = suiWallet.currentWallet?.ethaddress ?? '';
    print('suiWallet.currentWallet?.ethaddress=>${suiWallet.currentWallet?.ethaddress}');
  }
}
