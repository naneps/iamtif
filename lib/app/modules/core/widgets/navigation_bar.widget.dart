import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/shape/x_container.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return XContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutBack,
      width: Get.width,
      height: 50,
      color: Colors.white,
      child: const Row(
        children: [
          Icon(Icons.menu),
        ],
      ),
    );
  }
}
