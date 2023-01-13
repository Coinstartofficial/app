import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:flutter/material.dart';

///author: lty
////Time: 2023/01/13
////Description:
class SetUpNotice extends StatelessWidget {
  const SetUpNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(AppIcons.register_done),
            fit: BoxFit.contain,
            width: 162,
            height: 172,
          ),
          const SizedBox(height: 40),
          Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.only(
              left: 68,
              right: 68,
            ),
            child: const Text(
              'Grab a pen and paper',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.only(
              left: 68,
              right: 68,
            ),
            child: const Text(
              '''Prepare to write down your recovery phrase. lt's the only way to have access to and recover your wallet in the event you lose your device. Do not send it to yourself via email or take a screenshot. It's safer when kept offline.''',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 52).copyWith(top: 24),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(colors: [
                  Color(0xffA376DD),
                  Color(0xff7C4FC0),
                ]),
              ),
              height: 52,
              alignment: Alignment.center,
              child: const Text(
                'Got it',
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
    );
  }
}
