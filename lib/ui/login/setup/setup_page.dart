import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:coinstart_wallet_extension/base/MyBotTextToast.dart';
import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/generated/l10n.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/setup_controller.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/widget/setup_loading.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/widget/setup_notice.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/widget/setup_result.dart';
import 'package:coinstart_wallet_extension/ui/login/setup/widget/setup_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:
class SetUpPage extends GetView<SetUpController> {
  const SetUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APP_MainBGColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 80,
              ),
              child: Image(
                image: const AssetImage(AppIcons.welcome_line),
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(AppIcons.welcome_logo),
                    fit: BoxFit.contain,
                    width: 124,
                    height: 124,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 32.5,
                      right: 32.5,
                    ),
                    child: const Text(
                      'Let’s set up your wallet',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 12,
                        ),
                        child: const Text(
                          'You need a connected wallet to use',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.color_a299aa,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: const Text(
                          'OpenSui. Either create a new wallet',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.color_a299aa,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: const Text(
                          'or import an existing one.',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.color_a299aa,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      Get.generalDialog(
                        pageBuilder: (context, __, ___) => const SetUpLoading(),
                      );
                      var mnemonic = await controller.doGenerateMnemonic();
                      if (mnemonic != null) {
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          Get.back();
                          Get.generalDialog(pageBuilder: (context, __, ___) => const SetUpSuccess());
                          Future.delayed(const Duration(milliseconds: 3000), () {
                            Get.back();
                            Get.toNamed(Routes.SETUP_RESULT, arguments: {'mnemonic': mnemonic});
                          });
                        });
                      } else {
                        Get.back();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 52).copyWith(top: 38),
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
                        'Create New Wallet',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.IMPORT);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 52).copyWith(top: 16),
                      decoration: const BoxDecoration(
                        color: Color(0xff3A393F),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      height: 52,
                      alignment: Alignment.center,
                      child: const Text(
                        'Import existing wallet',
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
          ],
        ),
      ),
    );
  }
}
