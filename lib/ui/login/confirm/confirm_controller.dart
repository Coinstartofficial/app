import 'dart:math';

import 'package:coinstart_wallet_extension/base/MyBotTextToast.dart';
import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class ConfirmController extends GetxController {
  final mnemonicRadomIndexStr = ''.obs;
  final mnemonicRadomList = [].obs;
  List<String>? mnemonicList;
  final textControllerList = [TextEditingController(), TextEditingController(), TextEditingController()];
  dynamic argument;

  @override
  void onInit() {
    super.onInit();
    argument = Get.arguments;
    var mnemonic = argument['mnemonic'];
    mnemonicList = mnemonic?.split(' ')?.toList();
    if (mnemonicList != null) {
      var randomList = random(mnemonicList!);
      mnemonicRadomList.assignAll(randomList);
      var first = randomList[0];
      var second = randomList[1];
      var third = randomList[2];
      mnemonicRadomIndexStr.value = '${first}th,${second}th, and ${third}th';
    }
  }

  @override
  void onClose() {
    for (var element in textControllerList) {
      element.dispose();
    }
    super.onClose();
  }

  bool check() {
    for (int i = 0; i < 3; i++) {
      var element = textControllerList[i];
      if (element.text.isEmpty || element.text != mnemonicList![mnemonicRadomList[i] - 1]) {
        return false;
      }
    }
    return true;
  }

  void submit() {
    if (check()) {
      Get.toNamed(Routes.INPUT_PASS, arguments: argument);
    } else {
      showMyCustomText(S.current.Verify_Mnemonic_Phrase_Tip);
    }
  }

  List<int> random(List<String> list) {
    int sizeOfCopiedList = list.length;

    List<int> choosedList = [];
    int index = -1;
    var random = Random();
    for (int i = 0; i < sizeOfCopiedList; i++) {
      index = random.nextInt(sizeOfCopiedList);
      if (choosedList.contains(index + 1)) {
        continue;
      }
      choosedList.add(index + 1);
      if (choosedList.length == 3) {
        break;
      }
    }
    choosedList.sort((left, right) => left.compareTo(right));
    return choosedList;
  }
}
