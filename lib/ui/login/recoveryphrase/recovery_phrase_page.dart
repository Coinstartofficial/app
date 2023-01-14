import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/ui/login/recoveryphrase/recovery_phrase_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:
class RecoveryPhrasePage extends GetView<RecoveryPhraseController> {
  const RecoveryPhrasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: const Text(
                  'Your recovery phrase',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.only(
                  left: 68,
                  right: 68,
                ),
                child: const Text(
                  '''Write down these 12 words in the order given below and store them in a secret, safe place.''',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.color_a299aa,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 29,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.color_212937,
                ),
                child: Obx(
                  () => GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 3 / 1,
                    children: controller.mnemonicList
                        .asMap()
                        .map((i, element) => MapEntry(
                            i,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${i + 1}.',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.color_a299aa,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  '$element',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.color_ffffff,
                                  ),
                                )
                              ],
                            )))
                        .values
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.CONFIRM, arguments: Get.arguments);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 52).copyWith(top: 24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(colors: [
                      Color(0xffA376DD),
                      Color(0xff7C4FC0),
                    ]),
                  ),
                  height: 52,
                  alignment: Alignment.center,
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
