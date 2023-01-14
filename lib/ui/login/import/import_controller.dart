import 'package:coinstart_wallet_extension/base/MyBotTextToast.dart';
import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class ImportController extends GetxController {
  var textController = TextEditingController();
  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void sumit() {
    if (textController.text.isNotEmpty) {
      Get.toNamed(Routes.INPUT_PASS, arguments: {'mnemonic': textController.text});
    } else {
      showMyCustomText(S.current.Verify_Mnemonic_Phrase_Tip);
    }
  }
}
