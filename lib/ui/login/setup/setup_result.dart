import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/13
////Description:

class SetUpResult extends StatelessWidget {
  const SetUpResult({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(AppIcons.setup_rectangle),
                fit: BoxFit.contain,
                width: 162,
                height: 172,
              ),
              const SizedBox(height: 40),
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: const Text(
                  'Grab a pen and paper',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: const Text(
                  '''Prepare to write down your recovery phrase. lt's the only way to have access to and recover your wallet in the event you lose your device. Do not send it to yourself via email or take a screenshot. It's safer when kept offline.''',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.color_a299aa,
                  ),
                  textAlign: TextAlign.center,
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
                  Get.offAndToNamed(Routes.RECOVERY_PHRASE, arguments: data);
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
                    'Got it',
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
