import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/ui/login/confirm/confirm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:
class ConfirmPage extends GetView<ConfirmController> {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        return ListView(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: const Text(
                '''So, let's check''',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.color_ffffff,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.only(
                left: 18,
                right: 18,
              ),
              child: Text(
                '''To check whether you've written down your recovery phrase correctly, please enter the ${controller.mnemonicRadomIndexStr.value} words.''',
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.color_a299aa,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                children: controller.mnemonicRadomList
                    .asMap()
                    .map(
                      (i, element) => MapEntry(
                        i,
                        Container(
                          margin: const EdgeInsets.only(
                            top: 12,
                            right: 47,
                          ),
                          child: SizedBox(
                            height: 52,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 37,
                                  child: Text(
                                    '${element}th',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.color_6c6771,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.color_212937,
                                    ),
                                    // color: AppColors.color_212937,
                                    child: TextField(
                                      obscureText: false,
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.color_ffffff,
                                      ),
                                      controller: controller.textControllerList[i],
                                      decoration: const InputDecoration(
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.color_a299aa,
                                        ),
                                        counterText: '',
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          top: 0,
                                          bottom: 0,
                                          left: 16,
                                          right: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                controller.submit();
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
          ],
        );
      }),
    );
  }
}
