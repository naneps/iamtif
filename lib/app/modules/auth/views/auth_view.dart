import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/shape/x_container.dart';
import 'package:iamtif/app/common/theme.dart';
import 'package:iamtif/app/modules/auth/widgets/form_login.dart';
import 'package:iamtif/app/modules/auth/widgets/form_register.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.theme.primaryColor,

      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 2.5,
              image: const AssetImage(
                'assets/icon/logo_io.png',
              ),
              opacity: 0.3,
              repeat: ImageRepeat.repeat,
              colorFilter: ColorFilter.mode(
                ThemeApp().darkColor.withOpacity(0.1),
                BlendMode.lighten,
              ),
              centerSlice: Rect.zero,
              // invertColors: true,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(),
              XContainer(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeApp().darkColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeApp().darkColor.withOpacity(0.5),
                      blurRadius: 18,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                child: XContainer(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: ThemeApp().lightColor,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/icon/logo.png',
                      ),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                  child: const SizedBox(
                    height: 130,
                    width: double.infinity,
                  ),
                ),
              ),
              const Spacer(),
              Obx(() {
                return XContainer(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  constraints: BoxConstraints(
                    minHeight: 200,
                    maxHeight: controller.isLoginForm.value ? 390 : 480,
                  ),
                  decoration: BoxDecoration(
                    color: ThemeApp().lightColor,
                    border: Border.all(
                      color: ThemeApp().darkColor,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ThemeApp().darkColor.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(5, 20),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    viewportFraction: 1,
                    children: const [FormLogin(), FormRegister()],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
