import 'dart:convert';

import 'package:coinstart_wallet_extension/ui/web/browser/models/js_call_back.dart';
import 'package:coinstart_wallet_extension/ui/web/browser/utils/browser_config.dart';
import 'package:coinstart_wallet_extension/ui/web/browser/utils/sailer_help.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

///author: lty
////Time: 2023/01/16
////Description:
class Browser extends StatefulWidget {
  final String? initialUrl;
  final String? userAgent;
  final WebViewCreatedCallback? onWebViewCreated;
  final PageStartedCallback? onPageStarted;
  final PageFinishedCallback? onPageFinished;
  final PageLoadingCallback? onLoadingProgress;
  final WebResourceErrorCallback? onWebResourceError;
  final Set<JavascriptChannel>? javascriptChannels;
  final SailerDelegate sailerDelegate;
  final NavigationDelegate? navigationDelegate;

  const Browser(
      {super.key,
      this.initialUrl,
      this.userAgent,
      this.onWebViewCreated,
      this.onPageStarted,
      this.onPageFinished,
      this.onLoadingProgress,
      this.javascriptChannels,
      required this.sailerDelegate,
      this.navigationDelegate,
      this.onWebResourceError});

  @override
  State createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  late WebViewController _controller;
  late Set<JavascriptChannel> javascriptChannels;

  @override
  void initState() {
    if (widget.javascriptChannels == null) {
      javascriptChannels = <JavascriptChannel>{
        _browserJavascriptChannel(context, widget.sailerDelegate),
      };
    } else {
      bool addResult = widget.javascriptChannels!.add(_browserJavascriptChannel(context, widget.sailerDelegate));
      if (addResult) {
        javascriptChannels = widget.javascriptChannels!;
      } else {}
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.initialUrl,
      userAgent: widget.userAgent,
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: BrowserConfig().isDebug,
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
        widget.onWebViewCreated?.call(webViewController);
      },
      navigationDelegate: widget.navigationDelegate,
      javascriptChannels: javascriptChannels,
      onPageStarted: (String url) {
        widget.onPageStarted?.call(url);
      },
      onPageFinished: (String url) {
        widget.onPageFinished?.call(url);
      },
      onProgress: (int progress) {
        widget.onLoadingProgress?.call(progress);
      },
      onWebResourceError: widget.onWebResourceError,
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
          Factory<TapGestureRecognizer>(
            () => TapGestureRecognizer()
              ..onTapDown = (tap) {
                SystemChannels.textInput.invokeMethod('TextInput.hide'); //This will hide keyboard ontapdown
              },
          ),
        ),
      gestureNavigationEnabled: false,
    );
  }

  ///js调用flutter方法并获取执行结果
  JavascriptChannel _browserJavascriptChannel(BuildContext context, SailerDelegate sailerDelegate) {
    return JavascriptChannel(
        name: 'NativeInterface',
        onMessageReceived: (JavascriptMessage message) {
          try {
            String dataTrim = message.message.trim();
            if (BrowserConfig().isDebug) {
              print("Browser:--------\nJsonMessage:$dataTrim\nBrowser:--------");
            }
            if (dataTrim.indexOf("native-call:") == 0) {
              List<String> calls = dataTrim.split(r"$");
              String callId = "", action = "", param = "";
              // Sailer callId获取
              if (calls.length > 0) {
                callId = calls[0].replaceFirst("native-call:", "");
              }
              // action 获取
              if (calls.length > 2) action = calls[2];
              // param 获取
              if (calls.length > 3) param = calls[3];
              if (param.startsWith("function (t)")) {
                param = "";
              }
              try {
                BrowserConfig().internal.getActionInterface(action).addSailerDelegate(sailerDelegate).addWebViewController(_controller).handlerUrl(context, param).then((data) {
                  JsCallBack jsCallBack = JsCallBack();
                  jsCallBack.data = data;
                  jsCallBack.returnCode = "0000";
                  jsCallBack.returnMsg = "调用成功";
                  print("Wallet.onSuccess('$callId','${jsonEncode(jsCallBack.toJson())}')");

                  _controller.runJavascript("Wallet.onSuccess('$callId','${jsonEncode(jsCallBack.toJson())}')");
                }).catchError((error) {
                  JsCallBack jsCallBack = JsCallBack();
                  jsCallBack.data = error;
                  jsCallBack.returnCode = "1111";
                  jsCallBack.returnMsg = "调用失败";

                  print("Wallet.onFail('$callId','${jsonEncode(jsCallBack.toJson())}')");
                  _controller.runJavascript("Wallet.onFail('$callId','${jsonEncode(jsCallBack.toJson())}')");
                });
              } catch (error) {
                JsCallBack jsCallBack = JsCallBack();
                jsCallBack.data = error;
                jsCallBack.returnCode = "1111";
                jsCallBack.returnMsg = "调用失败";

                print("Wallet.onFail('$callId','${jsonEncode(jsCallBack.toJson())}')");
                _controller.runJavascript("Wallet.onFail('$callId','${jsonEncode(jsCallBack.toJson())}')");
              }
            }
          } catch (ex, stack) {
            print(ex);
            print(stack);
            // ex.printStackTrace();
          }
        });
  }
}
