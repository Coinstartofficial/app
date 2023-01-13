import 'dart:math';

import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class ConfirmController extends GetxController {
  final mnemonicRadomIndexStr = ''.obs;
  final mnemonicRadomList = [].obs;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;
    var mnemonic = data['mnemonic'];
    List<String>? list = mnemonic?.split(' ')?.toList();
    if (list != null) {
      var randomList = random(list);
      mnemonicRadomList.assignAll(randomList);
      var first = randomList[0];
      var second = randomList[1];
      var third = randomList[2];
      mnemonicRadomIndexStr.value = '${first}th,${second}th, and ${third}th';
    }
  }

  void check() {}
  List<int> random(List<String> list) {
    int sizeOfCopiedList = list.length;

    List<int> choosedList = [];
    int index = -1;
    var random = Random();
    for (int i = 0; i < sizeOfCopiedList; i++) {
      index = random.nextInt(sizeOfCopiedList);
      if (choosedList.contains(index)) {
        continue;
      }
      choosedList.add(index + 1);
      if (choosedList.length == 3) {
        break;
      }
    }
    return choosedList;
  }
}
