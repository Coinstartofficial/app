
import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:neveruseless/neveruseless.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
class DAppWebview extends StatefulWidget {
  final Map? arguments;
  const DAppWebview({Key? key, this.arguments}) : super(key: key);

  @override
  createState() => _DAppWebviewState();
}

class _DAppWebviewState extends State<DAppWebview> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;


  String url =  "";

  final TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    PagePick.nowPageName = '/DAppWebview';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
      ),
    );
  }

  _jsCallNativeChannel() {
    return <JavascriptChannel>[
      _jsCallNativeJavascriptChannel(context),
    ].toSet();
  }

  _jsCallNativeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: "postStatus",
        onMessageReceived: (JavascriptMessage message) {
          print("Js call native ：${message.message}");
        });
  }

}





