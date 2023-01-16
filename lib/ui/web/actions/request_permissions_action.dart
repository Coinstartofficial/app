import 'package:coinstart_wallet_extension/ui/web/browser/utils/sailer_help.dart';
import 'package:flutter/material.dart';

///author: lty
////Time: 2023/01/16
////Description:

class RequestPermissionsAction extends SailerActionInterface {
  @override
  Future<dynamic> handlerUrl(BuildContext context, String param) async {
    super.handlerUrl(context, param);
    print('requestPermissions');

    return 'requestPermissions';
  }
}
