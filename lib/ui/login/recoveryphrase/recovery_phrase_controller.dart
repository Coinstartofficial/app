import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:
class RecoveryPhraseController extends GetxController {
  final mnemonicList = <String>[].obs;
  final mnemonicJson = {}.obs;
  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    var mnemonic = data['mnemonic'];
    print(mnemonic);
    var list = mnemonic?.split(' ').toList();
    if (list != null) {
      mnemonicList.assignAll(list);
    }

    // print('mnemonic=>$mnemonic');
    // var suiWallet = Get.find<SuiWalletController>();
    // await suiWallet.addWallet(mnemonic, '12341234');
    // var simpleKeyPair = await getKeypairFromMnemonics(mnemonic);
    // var address = await getSuiAddress(simpleKeyPair);
    // print(address);
  }
}
