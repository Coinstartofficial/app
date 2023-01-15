import 'package:flutter/material.dart';
import 'package:get/get.dart';

///author: lty
////Time: 2023/01/15
////Description:

class MainController extends GetxController {
  var currentPage = 0.obs;

  var pageViewController = PageController();
  void tabSelected(int page) {
    pageViewController.jumpToPage(page);
    currentPage.value = page;
  }
}
