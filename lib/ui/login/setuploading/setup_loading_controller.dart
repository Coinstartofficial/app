import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/controller/mnemonic.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/14
////Description:

class SetUpLoadingController extends GetxController {
  var result = false.obs;

  @override
  void onInit() {
    super.onInit();
    doGenerateMnemonic();
  }

  Future<void> doGenerateMnemonic() async {
    result.value = false;
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      var mnemonic = generateMnemonic();
      result.value = true;
      Future.delayed(const Duration(milliseconds: 300), () {
        Get.offAndToNamed(Routes.SETUP_RESULT, arguments: {'mnemonic': mnemonic});
      });
    } catch (_) {
      Get.back();
      result.value = false;
    }
  }
}
