import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/modules/home/views/home_view.dart';

class CoreController extends GetxController {
  //TODO: Implement CoreController
  final scrollController = ScrollController();
  RxBool isShowBottomSheet = true.obs;
  RxInt positionBottomSheet = 0.obs;
  RxInt tabIndex = 0.obs;
  Widget currentView() {
    switch (tabIndex.value) {
      case 0:
        return const HomeView();
      case 1:
        return Container(
          color: Colors.blue,
        );
      case 2:
        return Container(
          color: Colors.green,
        );
      case 3:
        return Container(
          color: Colors.yellow,
        );
      default:
        return Container(
          color: Colors.red,
        );
    }
  }

  @override
  void onClose() {}

  @override
  void onReady() {
    // scrollController.jumpTo(
    //   scrollController.position.pixels + 100,
    // );
    // scrollController.addListener(() {
    //   // check if user scrol top or bottom
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.reverse) {
    //     print('scroll down');
    //     isShowBottomSheet.value = true;
    //     positionBottomSheet.value = -50;
    //   }
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.forward) {
    //     print('scroll up');
    //     positionBottomSheet.value = 0;
    //     isShowBottomSheet.value = false;
    //   }
    // });
    super.onReady();
  }
}
