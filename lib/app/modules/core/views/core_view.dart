import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/shape/x_container.dart';
import 'package:iamtif/app/common/theme.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: XContainer(
        width: Get.context!.width,
        child: Obx(() {
          return CustomNavigationBar(
              borderRadius: const Radius.circular(20),
              strokeColor: ThemeApp().primaryColor,
              selectedColor: ThemeApp().primaryColor,
              onTap: (val) {
                controller.tabIndex.value = val;
              },
              backgroundColor: ThemeApp().darkColor,
              currentIndex: controller.tabIndex.value,
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                    color: ThemeApp().primaryColor,
                  ),
                ),
                CustomNavigationBarItem(
                  selectedIcon: Icon(
                    Icons.search,
                    color: ThemeApp().primaryColor,
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  selectedIcon: Icon(
                    Icons.add,
                    color: ThemeApp().primaryColor,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  selectedIcon: Icon(
                    Icons.favorite,
                    color: ThemeApp().primaryColor,
                  ),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  selectedIcon: Icon(
                    Icons.person,
                    color: ThemeApp().primaryColor,
                  ),
                ),
              ]);
        }),
      ),
      //   bottomSheet: Obx(
      //     () => AnimatedContainer(
      //       //   margin: const EdgeInsets.all(10),
      //       duration: const Duration(milliseconds: 500),
      //       height: !controller.isShowBottomSheet.value ? 60 : 0,
      //       decoration: BoxDecoration(
      //           color: ThemeApp().primaryColor,
      //           borderRadius: const BorderRadius.only(
      //             topLeft: Radius.circular(20),
      //             topRight: Radius.circular(20),
      //           )),
      //       child: Container(
      //           // color: Colors.red,
      //           ),
      //     ),
      //   ),
      body: SafeArea(
        child: XContainer(
          width: Get.context!.width,
          height: Get.context!.height,
          padding: EdgeInsets.zero,
          child: Obx(() {
            return controller.currentView();
          }),
        ),
      ),
    );
  }
}
