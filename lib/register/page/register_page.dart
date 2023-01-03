import 'dart:ui';

import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:flutter/material.dart';
import 'package:neveruseless/neveruseless.dart';

import '../../main.dart';

class RegisterPage extends StatefulWidget {
  final Map? arguments;

  const RegisterPage({Key? key, this.arguments}) : super(key: key);

  @override
  createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? localPwa;

  @override
  void initState() {
    super.initState();
    PagePick.nowPageName = '/RegisterPage';

    neverLocalStorageRead("LocalPassword").then((v) {
      localPwa = v;
      setState(() {});
    });

    neverLocalStorageRead("register_flow").then((v) {
      if (v != 'null') {
        Navigator.pushNamed(context, "/RegisterAccountPage", arguments: {
          "register_flow": v,
        });
      }
    });


    neverLocalStorageRead("register_flow2").then((v) {
      if (v != 'null') {
        Navigator.pushNamed(context, "/CreateImportWalletPage", arguments: {
          "register_flow": v,
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: true,
      bottom: false,
      left: true,
      top: false,
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
              color: const Color.fromRGBO(1, 6, 9, 1),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    color: Colors.black,
                    child: Image(
                      image: const AssetImage("assets/images/index_bg_image.png"),
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Stack(
                                children: [
                                  const Image(
                                    image: AssetImage("assets/images/index_icon.png"),
                                    fit: BoxFit.contain,
                                    width: 124,
                                    height: 124,
                                  ),
                                  BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
                                    child: const SizedBox(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: Text(
                              "Welcome to ",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: const Text(
                              "OpenSui",
                              style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/RegisterAccountPage");
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: APP_MainPurpleColor,
                                borderRadius: BorderRadius.all(Radius.circular(22.0)),
                              ),
                              // padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              // margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                              height: 46,
                              width: 300,
                              alignment: Alignment.center,
                              child: const Text(
                                'Create New Wallet',
                                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              if (localPwa == 'null') {
                                Navigator.pushNamed(context, "/RegisterAccountPage");
                              } else {
                                Navigator.pushNamed(context, "/EmailLoginPage");
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(width: 1, color: APP_MainPurpleColor),
                                borderRadius: const BorderRadius.all(Radius.circular(22)),
                              ),
                              height: 46,
                              width: 300,
                              // padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              // margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                              alignment: Alignment.center,
                              child: const Text(
                                'Login with email',
                                style: TextStyle(fontSize: 14, color: APP_MainPurpleColor, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          // Text(
                          //   S.current.Forgot_Password,
                          //   style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
