import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:flutter/material.dart';

///author: lty
////Time: 2023/01/13
////Description:
class SetUpSuccess extends StatelessWidget {
  const SetUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                'Your wallet has just created!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
