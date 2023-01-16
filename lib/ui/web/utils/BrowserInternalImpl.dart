import 'package:coinstart_wallet_extension/ui/web/actions/get_accounts_action.dart';
import 'package:coinstart_wallet_extension/ui/web/actions/request_permissions_action.dart';
import 'package:coinstart_wallet_extension/ui/web/browser/utils/sailer_help.dart';

///author: lty
////Time: 2023/01/16
////Description:

class BrowserInternalImpl extends BrowserInternal {
  BrowserInternalImpl();

  Map<String, dynamic> actionMap = {
    "getAccounts": GetAccountsAction(),
    "requestPermissions": RequestPermissionsAction(),
  };

  @override
  SailerActionInterface getActionInterface(String actionName) {
    return actionMap[actionName];
  }
}
