import 'package:coinstart_wallet_extension/ui/web/browser/utils/sailer_help.dart';

///author: lty
////Time: 2023/01/16
////Description:
class BrowserConfig {
  factory BrowserConfig() => _browserConfig();
  static final BrowserConfig _instance = BrowserConfig._();
  BrowserConfig._();

  static BrowserConfig _browserConfig() {
    return _instance;
  }

  bool isDebug = false;

  late BrowserInternal internal;

  BrowserConfig setDebug(bool isDebug) {
    this.isDebug = isDebug;
    return this;
  }

  BrowserConfig setBrowserInternal(BrowserInternal internal) {
    this.internal = internal;
    return this;
  }
}
