import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/shape/x_container.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: XContainer(
          height: Get.height,
          width: Get.width,
          color: Get.theme.primaryColor,
          child: Obx(() {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: XContainer(
                    height: Get.height,
                    width: Get.width,
                    color: const Color.fromARGB(255, 171, 61, 61),
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: List.generate(
                          10,
                          (index) => XContainer(
                            width: Get.width,
                            height: 100,
                            margin: const EdgeInsets.all(10),
                            color: Colors.white,
                            child: const Center(
                              child: Text('data'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: XContainer(
                    width: Get.width,
                    height: 70,
                    radius: 10,
                    color: Colors.white,
                    child: Row(
                      children: [
                        XContainer(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(2),
                          color: Get.theme.primaryColor,
                          radius: 50,
                          margin: const EdgeInsets.only(right: 10),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/icon/logo.png'),
                          ),
                        ),
                        Text(
                          'iamtif',
                          style: Get.textTheme.titleLarge,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: controller.positionBottomSheet.value.toDouble(),
                  child: XContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: Get.width,
                    height: 50,
                    color: Colors.white,
                    child: const Row(
                      children: [
                        Icon(Icons.menu),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
