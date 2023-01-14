import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/ui/login/setuploading/setup_loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/14
////Description:
class SetUpLoadingPage extends GetView<SetUpLoadingController> {
  const SetUpLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Visibility(
                visible: !controller.result.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SpinKitCircle(
                      color: AppColors.color_ac8af8,
                      size: 72,
                    ),
                    const SizedBox(height: 52),
                    Container(
                      alignment: AlignmentDirectional.center,
                      margin: const EdgeInsets.only(
                        left: 32.5,
                        right: 32.5,
                      ),
                      child: const Text(
                        'Generating wallet...',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.result.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(AppIcons.register_done),
                      fit: BoxFit.contain,
                      width: 162,
                      height: 172,
                    ),
                    const SizedBox(height: 40),
                    Container(
                      alignment: AlignmentDirectional.center,
                      margin: const EdgeInsets.only(
                        left: 68,
                        right: 68,
                      ),
                      child: const Text(
                        'Your wallet has just created!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
