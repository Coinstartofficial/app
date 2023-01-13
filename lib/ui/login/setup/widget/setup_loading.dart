import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///author: lty
////Time: 2023/01/13
////Description:
class SetUpLoading extends StatelessWidget {
  const SetUpLoading({super.key});

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
            const SpinKitCircle(
              color: AppColors.color_ac8af8,
              size: 72,
            ),
            const SizedBox(height: 52),
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.only(
                left: 32.5,
                right: 32.5,
              ),
              child: const Text(
                'Generating wallet...',
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
