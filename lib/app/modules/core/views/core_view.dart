import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/shape/x_container.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: controller.isShowBottomSheet.value ? 50 : 0,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
      body: SafeArea(
        child: XContainer(
          child: controller.currentView(),
        ),
      ),
    );
  }
}
