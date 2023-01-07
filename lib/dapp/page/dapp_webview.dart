
import 'package:coinstart_wallet_extension/controller/sui_wallet_controller.dart';
import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:neveruseless/neveruseless.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:js' as js;

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

  // 暂时只考虑这一种情况
  String url =  "https://coinstart.io/#";

  final SuiWalletController suiWalletController = SuiWalletController();

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

    js.context["getWalletAddress"] = () {
      if (suiWalletController.currentWallet == null){
        Navigator.pushNamed(context, "/RegisterPage");
      }
      return suiWalletController.currentWallet;
    };

    return Container(
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
      ),
    );
  }


}





