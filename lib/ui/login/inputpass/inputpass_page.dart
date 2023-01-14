import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/ui/login/inputpass/inputpass_controller.dart';
import 'package:coinstart_wallet_extension/ui/login/inputpass/widget/customjpasswordfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

///author: lty
////Time: 2023/01/14
////Description:
class InputPassPage extends GetView<InputPassController> {
  const InputPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 114,
            ),
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Text(
                controller.inputState.value ? 'Re-enter passcode' : 'Create new passcode',
                style: const TextStyle(
                  fontSize: 30,
                  color: AppColors.color_ffffff,
                ),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Visibility(
              visible: !controller.inputState.value,
              child: PWEditField(
                  textFieldCount: 4,
                  textFieldWidth: 12,
                  textFieldHeight: 12,
                  textFieldSpace: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp("[0-9]"), allow: true),
                  ],
                  autoFocus: true,
                  onChanged: (value) {
                    if (value.length == 4) {
                      controller.firstPwd.value = value;
                      Future.delayed(const Duration(milliseconds: 300), () {
                        controller.inputState.value = true;
                      });
                    }
                  }),
            ),
            Visibility(
              visible: controller.inputState.value,
              child: PWEditField(
                  textFieldCount: 4,
                  textFieldWidth: 12,
                  textFieldHeight: 12,
                  textFieldSpace: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp("[0-9]"), allow: true),
                  ],
                  autoFocus: true,
                  onChanged: (value) {
                    if (value.length == 4) {
                      controller.secondPwd.value = value;
                      if (controller.secondPwd.value == controller.firstPwd.value) {
                        Future.delayed(const Duration(milliseconds: 300), () {
                          controller.addWalletToLocal();
                        });
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
