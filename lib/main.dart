import 'package:bot_toast/bot_toast.dart';
import 'package:coinstart_wallet_extension/base/routes.dart';
import 'package:coinstart_wallet_extension/api/sui_api.dart';
import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:coinstart_wallet_extension/common/di/initial_binding.dart';
import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/controller/sui_wallet_controller.dart';
import 'package:coinstart_wallet_extension/generated/l10n.dart';
import 'package:coinstart_wallet_extension/home_page.dart';
import 'package:coinstart_wallet_extension/register/page/register_page.dart';
import 'package:coinstart_wallet_extension/setup/page/need_password_page.dart';
import 'package:coinstart_wallet_extension/ui/web/browser/utils/browser_config.dart';
import 'package:coinstart_wallet_extension/ui/web/utils/BrowserInternalImpl.dart';
import 'package:coinstart_wallet_extension/wallet/page/record_page.dart';
import 'package:coinstart_wallet_extension/wallet/page/swap_page.dart';
import 'package:coinstart_wallet_extension/wallet/page/swap_record_details_page.dart';
import 'package:coinstart_wallet_extension/wallet/pagekbg/record_detail_page.dart';
import 'package:coinstart_wallet_extension/wallet/pagekbg/swap_detail_page_kbg.dart';
import 'package:coinstart_wallet_extension/wallet/pagekbg/swap_page_kbg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:neveruseless/neveruseless.dart';

String localNow = "English";
String localPara = "CNY";
SuiApi suiApi = SuiApi();
SuiWalletController suiWallet = SuiWalletController();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put(SuiApi());
  await suiWallet.loadStorageWallet();

  BrowserConfig().setDebug(true).setBrowserInternal(BrowserInternalImpl());
  runApp(const MyApp());
  ErrorWidget.builder = (FlutterErrorDetails error) {
    return const Center(
      child: Text("遇到错误,请联系客服"),
    );
  };
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Clipboard.setData(const ClipboardData(text: ""));

    neverBus.on('checkLanguage', (object) {
      setState(() {
        if (object == "en") {
          print("切换语言EN");
          localNow = "English";
          S.load(const Locale('en', 'US'));
        } else {
          print("切换语言ZH");
          localNow = "中文简体";
          S.load(const Locale("zh", "ZH"));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('en', 'US'),
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale("zh", "ZH"),
      ],
      initialBinding: InitialBinding(),
      title: 'CoinStart',
      initialRoute: Routes.SETUP,
      getPages: AppPages.routes,
      theme: Themes.defaultTheme,
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          //设置文字大小不随系统设置改变
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: BotToastInit()(context, child),
        );
      },
    );
  }
}

//全局临时参数
class PagePick {
  static String nowPageName = '';
}

//插件
//flutter build web --web-renderer html --csp

//H5
// flutter build web --pwa-strategy none --web-renderer canvaskit --release
