import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/ui/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // Navigator.pushNamed(context, "/SelectWalletPage");
                      },
                      child: Container(
                        height: 36,
                        width: 117,
                        decoration: const BoxDecoration(
                          color: APP_MainGrayColor,
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcons.welcome_logo,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Wallet",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.white,
                              size: 11,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 42,
                      height: 36,
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                        color: APP_MainGrayColor,
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Image.asset(
                        AppIcons.wallet_online,
                        width: 28,
                        height: 28,
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Container(
                      width: 69,
                      height: 36,
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                        color: APP_MainGrayColor,
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.link_wallet_button_icon,
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Sui',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          width: 60,
                          height: 36,
                          alignment: AlignmentDirectional.center,
                          decoration: const BoxDecoration(
                            color: AppColors.color_9c56f6,
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          ),
                          child: const Icon(
                            Icons.qr_code_scanner,
                            size: 18,
                            color: AppColors.color_ffffff,
                          ),
                        ),
                      ),
                    ),
                    // _changeNetworkButton()
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '\$',
                    style: TextStyle(
                      fontSize: 42,
                      color: AppColors.color_ffffff,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '32,352.24',
                    style: TextStyle(
                      fontSize: 42,
                      color: AppColors.color_ffffff,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: 32,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                      border: Border.all(color: AppColors.color_606266),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            controller.ethaddress.value,
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Image.asset(
                          AppIcons.copy,
                          width: 18,
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 106,
                    height: 42,
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                      color: AppColors.color_9c56f6,
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    child: const Text(
                      'Bug',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 106,
                    height: 42,
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                      color: AppColors.color_9c56f6,
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 106,
                    height: 42,
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                      color: AppColors.color_9c56f6,
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    child: const Text(
                      'Receive',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                height: 42,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  color: AppColors.color_30000000,
                ),
                child: const Text(
                  'Steak',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Text(
                      'Assets',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 122,
                            height: 34,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.color_06ffffff,
                                contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(17)),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.color_40ffffff,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.color_40ffffff,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 34,
                            height: 34,
                            alignment: AlignmentDirectional.center,
                            decoration: const BoxDecoration(
                              color: AppColors.color_06ffffff,
                              borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: AppColors.color_ffffff,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.color_212124,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  children: [1, 2, 3, 4, 4, 5, 6]
                      .map((e) => SizedBox(
                            height: 46,
                            child: Row(
                              children: [
                                Image.asset(
                                  AppIcons.ETH,
                                  width: 32,
                                  height: 32,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'BTC',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '9.8',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '\$0.0',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
