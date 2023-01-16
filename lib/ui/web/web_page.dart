import 'dart:io';

import 'package:coinstart_wallet_extension/ui/web/browser/browser.dart';
import 'package:coinstart_wallet_extension/ui/web/web_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/16
////Description:
class WebPage extends GetView<WebController> {
  const WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     onPressed: () => Get.back(),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Browser(
              // initialUrl: 'assets/www/index.html',
              sailerDelegate: controller,
              onWebViewCreated: (webController) {
                webController.loadFlutterAsset('assets/www/index.html');
                controller.webViewController = webController;
              },
              navigationDelegate: controller.navigationDelegate,
              onLoadingProgress: (int progress) {
                controller.onLoadingProgress(progress);
              },
              onPageStarted: (url) {},
              onPageFinished: (url) {},
              onWebResourceError: (error) {},
            ),
            Obx(
              () {
                if (controller.loadProgress.value == 100) {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    controller.loadProgress.value = -1;
                  });
                }
                return WebProgressWidget(
                  progress: controller.loadProgress.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WebProgressWidget extends StatelessWidget {
  final num progress;
  const WebProgressWidget({super.key, required this.progress});
  @override
  Widget build(BuildContext context) {
    if (progress == -1) {
      return Container();
    } else {
      return Container(
        color: Colors.blue,
        height: 2,
        width: Get.width * progress / 100.0,
      );
    }
  }
}
