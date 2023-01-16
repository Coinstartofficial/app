import 'package:coinstart_wallet_extension/base/MyBotTextToast.dart';
import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/common/utils/app_state.dart';
import 'package:coinstart_wallet_extension/controller/sui_wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/14
////Description:

class InputPassController extends GetxController {
  final appState = Rx<AppState>(AppState.IDLE);
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

  Future<void> addWalletToLocal() async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      SuiWalletController suiWallet = Get.find();
      await suiWallet.addWallet(mnemonic, secondPwd.value * 2);
      Get.back();
      Get.toNamed(Routes.MAIN);
      appState.value = AppState.DONE;
    } catch (ex, stack) {
      appState.value = AppState.ERROR;
    }
  }
}
