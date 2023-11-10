import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class CoreController extends GetxController {
  //TODO: Implement CoreController
  final scrollController = ScrollController();
  RxBool isShowBottomSheet = false.obs;
  RxInt positionBottomSheet = 0.obs;

  @override
  void onReady() {
    // scrollController.animateTo(
    //   scrollController.position.minScrollExtent,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.easeInOut,
    // );
    scrollController.jumpTo(
      scrollController.position.pixels + 100,
    );
    scrollController.addListener(() {
      // check if user scrol top or bottom
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        print('scroll down');
        isShowBottomSheet.value = true;
        positionBottomSheet.value = -50;
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        print('scroll up');
        positionBottomSheet.value = 0;
        isShowBottomSheet.value = false;
      }
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
