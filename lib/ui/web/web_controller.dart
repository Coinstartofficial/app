import 'dart:async';

import 'package:coinstart_wallet_extension/ui/web/browser/utils/sailer_help.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

///author: lty
////Time: 2023/01/16
////Description:

class WebController extends GetxController with SailerDelegate {
  WebViewController? webViewController;
  var loadProgress = 0.obs;

  FutureOr<NavigationDecision> navigationDelegate(NavigationRequest request) {
    if (request.url.startsWith("mailto:") ||
        request.url.startsWith("tel:") ||
        request.url.startsWith("sms:") ||
        request.url.startsWith("weixin://") ||
        request.url.startsWith("alipays://")) {
      // launchURL(request.url);
      return NavigationDecision.navigate;
    }
    return NavigationDecision.navigate;
  }

  void onLoadingProgress(int progress) {
    loadProgress.value = progress;
  }

  @override
  void onInit() {
    super.onInit();
    // webViewController?.loadFlutterAsset('assets/www/index.html');
  }
}
