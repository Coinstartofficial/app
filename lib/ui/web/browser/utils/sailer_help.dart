import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///author: lty
////Time: 2023/01/16
////Description:
class SailerActionInterface {
  late SailerDelegate sailerDelegate;
  late WebViewController webViewController;
  bool isMain = false;

  SailerActionInterface addSailerDelegate(SailerDelegate sailerDelegate) {
    this.sailerDelegate = sailerDelegate;
    return this;
  }

  SailerActionInterface addWebViewController(WebViewController webViewController) {
    this.webViewController = webViewController;
    return this;
  }

  Future<dynamic> handlerUrl(BuildContext context, String param) {
    return Future.value("");
  }
}

abstract class SailerDelegate {
//  // 设置AppBar显示或隐藏
//  void changeAppBar(bool showAppBar) {}
//  // 获取当前WebView是否可以返回
//  Future<bool> canGoBack() async => false;
//  // WebView返回
//  Future<void> goBack() async {}
//  // 当前WebView重新加载url
//  Future<void> loadUrl(String url) async {}
//  // 当前WebView执行JavaScript代码
//  Future<String> evaluateScript(String script) async => '';
}

///browser全局工具类，传递给browser页面
abstract class BrowserInternal {
  ///js调用flutter接口
  SailerActionInterface getActionInterface(String actionName);
}
