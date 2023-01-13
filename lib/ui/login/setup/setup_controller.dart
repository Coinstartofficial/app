import 'package:coinstart_wallet_extension/controller/mnemonic.dart';
import 'package:coinstart_wallet_extension/main.dart';
import 'package:get/get.dart';
import 'package:coinstart_wallet_extension/controller/sui_wallet_controller.dart';

///author: lty
////Time: 2023/01/13
////Description:
class SetUpController extends GetxController {
  Future<String?> doGenerateMnemonic() async {
    try {
      var mnemonic = generateMnemonic();
      return mnemonic;
    } catch (_) {
      return null;
    }
  }
}
