import 'package:bot_toast/bot_toast.dart';
import 'package:coinstart_wallet_extension/common/di/initial_binding.dart';
import 'package:coinstart_wallet_extension/common/routes/app_pages.dart';
import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/controller/sui_wallet_controller.dart';
import 'package:coinstart_wallet_extension/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SuiWalletController suiWallet = SuiWalletController();
  // await suiWallet.loadStorageWallet();
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
      initialRoute: AppPages.INITIAL,
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
