import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:coinstart_wallet_extension/api/sui_api.dart';
import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:coinstart_wallet_extension/base/MyBotTextToast.dart';
import 'package:coinstart_wallet_extension/base/image_helper.dart';
import 'package:coinstart_wallet_extension/controller/json.dart';
import 'package:coinstart_wallet_extension/generated/l10n.dart';
import 'package:coinstart_wallet_extension/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:get/get.dart';
import 'package:neveruseless/neveruseless.dart';
import '../../main.dart';
import '../widgets/welcome_header.dart';

class CreatePhrasePage extends StatefulWidget {
  final Map? arguments;

  const CreatePhrasePage({Key? key, this.arguments}) : super(key: key);

  @override
  createState() => _CreatePhrasePageState();
}

class _CreatePhrasePageState extends State<CreatePhrasePage> {
  @override
  void initState() {
    super.initState();
    PagePick.nowPageName = '/CreatePhrasePage';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage("assets/images/index_icon.png"),
                      fit: BoxFit.contain,
                      width: 124,
                      height: 124,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Your recovery phrase',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'This phrase is the only way to recover your wallet. Do not share it with anyone!',
                      style: TextStyle(
                        color: Color(0xffCCC4D7),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        margin: const EdgeInsets.only(top: 16),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(colors: [
                            Color(0xffA376DD),
                            Color(0xff7C4FC0),
                          ]),
                        ),
                        height: 32,
                        alignment: Alignment.center,
                        child: const Text(
                          'Copy',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      'Recovery phrase',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 80,
                    ),
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0xff202020),
                      border: Border.all(color: const Color(0xff5E5D5D)),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Text(
                      'kiwi nose immune blouse license ability guide gas mimic note toilet panther',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pushNamed(context, "/SetPasswordPage");
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(colors: [
                          Color(0xffA376DD),
                          Color(0xff7C4FC0),
                        ]),
                      ),
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
