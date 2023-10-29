import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with GetTickerProviderStateMixin {
  final isLogin = true.obs;
  late final tabController;
  late final scrollController;
  //TODO: Implement AuthController

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(
        milliseconds: 700,
      ),
    );

    scrollController = ScrollController();
  }
}
