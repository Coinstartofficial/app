import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/ui/login/import/import_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class ImportPage extends GetView<ImportController> {
  const ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              alignment: AlignmentDirectional.center,
              child: const Text(
                'Your recovery phrase',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.color_ffffff,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              alignment: AlignmentDirectional.center,
              child: Column(children: const [
                Text(
                  'This phrase is the only way to recover',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.color_a299aa,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'your wallet. Do not share it with anyone !',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.color_a299aa,
                  ),
                  textAlign: TextAlign.center,
                )
              ]),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Recovery phrase',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.color_ffffff,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              // color: AppColors.color_212937,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.color_212937,
              ),
              // color: AppColors.color_212937,
              child: const TextField(
                maxLines: 6,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.color_ffffff,
                ),
                decoration: InputDecoration(
                  hintMaxLines: 6,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.color_a299aa,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    top: 14,
                    bottom: 0,
                    left: 16,
                    right: 16,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
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
        ),
      ),
    );
  }
}
