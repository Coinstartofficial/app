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
import 'package:flutter/services.dart';
import 'package:neveruseless/neveruseless.dart';
import '../../main.dart';
import '../widgets/welcome_header.dart';

class VerifyCodePage extends StatefulWidget {
  final Map? arguments;

  const VerifyCodePage({Key? key, this.arguments}) : super(key: key);

  @override
  createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  String? _email;
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    PagePick.nowPageName = '/VerifyCodePage';

    if (widget.arguments?['email'] != null) {
      _email = widget.arguments?['email'];
    }
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Please check your email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      _email ?? '',
                      style: const TextStyle(
                        color: Color(0xFF584ED3),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'and enter the recovery code in the email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 28),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff5E5D5D)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: TextField(
                        controller: _codeController,
                        cursorColor: const Color(0xFF584ED3),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          )
                        ],
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: '',
                          hintStyle: TextStyle(
                            color: Color(0xff9E9E9E),
                            fontSize: 14,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          fillColor: Color(0xff202020),
                          filled: true,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        showMyCustomLoading('Loading...');
                        // var res =
                        //     await SuiApi().sendVerifyCode(emailController.text);
                        // Map<String, dynamic> map = jsonDecode(res.body);
                        // print(map.toString());
                        // if (map['msg'] == 'SUCCESS') {}
                        Navigator.pushNamed(context, "/CreatePhrasePage");
                      } catch (e) {
                        print(e.toString());
                      } finally {
                        closeMyCustomBotLoading();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        gradient: LinearGradient(colors: [
                          Color(0xffA376DD),
                          Color(0xff7C4FC0),
                        ]),
                      ),
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Next',
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
