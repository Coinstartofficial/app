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

class SetPasswordPage extends StatefulWidget {
  final Map? arguments;

  const SetPasswordPage({Key? key, this.arguments}) : super(key: key);

  @override
  createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  String? _email;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void initState() {
    PagePick.nowPageName = '/SetPasswordPage';
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Center(
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
                      'Create a password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      'Please provide a password to ensure your wallet secure.',
                      style: TextStyle(
                        color: Color(0xffCCC4D7),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff5E5D5D)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        cursorColor: const Color(0xFF584ED3),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
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
                  const SizedBox(height: 16),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff5E5D5D)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordConfirmController,
                        cursorColor: const Color(0xFF584ED3),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
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
                      } catch (e) {
                        print(e.toString());
                      } finally {
                        closeMyCustomBotLoading();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(colors: [
                          Color(0xffA376DD),
                          Color(0xff7C4FC0),
                        ]),
                      ),
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Save',
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
          ),
        ));
  }
}
