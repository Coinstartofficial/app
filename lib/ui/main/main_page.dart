import 'package:coinstart_wallet_extension/common/style/styles.dart';
import 'package:coinstart_wallet_extension/common/utils/keep_alive_wrapper.dart';
import 'package:coinstart_wallet_extension/ui/colletion/colletion_tab_router.dart';
import 'package:coinstart_wallet_extension/ui/home/home_tab_router.dart';
import 'package:coinstart_wallet_extension/ui/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:
class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double safePadding = MediaQuery.of(context).padding.bottom;
    const double additionalBottomPadding = 4;
    return Obx(
      () => Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageViewController,
          onPageChanged: (page) {
            controller.currentPage.value = page;
          },
          children: const [
            KeepAliveWrapper(child: HomeTabRouter()),
            KeepAliveWrapper(child: ColletionTabRouter()),
            // KeepAliveWrapper(child: HomeTabRouter()),
            // KeepAliveWrapper(child: HomeTabRouter()),
            // KeepAliveWrapper(child: HomeTabRouter()),
            // KeepAliveWrapper(child: HomeTabRouter()),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: safePadding),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: kBottomNavigationBarHeight + additionalBottomPadding),
            child: BottomNavigationBar(
              currentIndex: controller.currentPage.value,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 14.0,
              unselectedFontSize: 12.0,
              elevation: 0,
              fixedColor: AppColors.color_9c56f6,
              unselectedItemColor: AppColors.color_ffffff,
              onTap: (page) {
                controller.tabSelected(page);
              },
              items: [
                BottomNavigationBarItem(
                  tooltip: '',
                  icon: Image.asset(AppIcons.tab_coin_after, width: 24, height: 24),
                  activeIcon: const ImageIcon(
                    AssetImage(AppIcons.tab_coin_before),
                    color: AppColors.color_9c56f6,
                    size: 24,
                  ),
                  label: "Wallet",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppIcons.tab_nft_after, width: 24, height: 24),
                  activeIcon: const ImageIcon(
                    AssetImage(AppIcons.tab_nft_before),
                    color: AppColors.color_9c56f6,
                    size: 24,
                  ),
                  label: "Colletion",
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppIcons.tab_dapp_after, width: 24, height: 24),
                  activeIcon: const ImageIcon(
                    AssetImage(AppIcons.tab_dapp_before),
                    color: AppColors.color_9c56f6,
                    size: 24,
                  ),
                  label: "Dapp",
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppIcons.tab_swap_after, width: 24, height: 24),
                  activeIcon: const ImageIcon(
                    AssetImage(AppIcons.tab_swap_before),
                    color: AppColors.color_9c56f6,
                    size: 24,
                  ),
                  label: "Swap",
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppIcons.tab_discover_after, width: 24, height: 24),
                  activeIcon: const ImageIcon(
                    AssetImage(AppIcons.tab_discover_before),
                    color: AppColors.color_9c56f6,
                    size: 24,
                  ),
                  label: "Discover",
                  tooltip: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
