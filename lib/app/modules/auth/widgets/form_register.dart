import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/buttons/x_button.dart';
import 'package:iamtif/app/common/input/x_field.dart';
import 'package:iamtif/app/common/theme.dart';
import 'package:iamtif/app/modules/auth/controllers/auth_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FormRegister extends GetView<AuthController> {
  const FormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Daftar Sih',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ).animate().fade(),
              InkWell(
                onTap: () {
                  Future.delayed(
                    const Duration(milliseconds: 400),
                    () => controller.isLoginForm.value = true,
                  );
                  controller.tabController.animateTo(0);
                },
                child: Icon(
                  MdiIcons.closeCircleOutline,
                  color: ThemeApp().darkColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          XTextField(
            prefixIcon: MdiIcons.accountOutline,
            labelText: 'Name',
            hintText: 'Jhon Doe',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Mana nama lu?';
              }
              return null;
            },
            onChanged: (value) {
              controller.user.value.name = value;
            },
          )
              .animate(
                delay: const Duration(milliseconds: 300),
              )
              .slideX(
                begin: 1,
                end: 0,
              ),
          const SizedBox(height: 15),
          XTextField(
            prefixIcon: MdiIcons.emailOutline,
            labelText: 'Email',
            hintText: 'jhonDoe@xxx.com',
            onChanged: (value) {
              controller.user.value.email = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Mana email lu?';
              }

              // Regular expression for a simple email validation
              final emailRegex =
                  RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

              if (!emailRegex.hasMatch(value)) {
                return 'Email nya yang bener dong';
              }

              return null;
            },
          )
              .animate(
                delay: const Duration(milliseconds: 300),
              )
              .slideX(
                begin: -1,
                end: 0,
              ),
          const SizedBox(height: 15),
          Obx(() {
            return Column(
              children: [
                XTextField(
                        prefixIcon: MdiIcons.lockOutline,
                        labelText: 'Password',
                        hintText: '********',
                        onChanged: (value) {
                          controller.user.value.password = value;
                        },
                        obscureText: controller.isPasswordVisible.value,
                        suffixIcon: controller.isPasswordVisible.value
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        onPressSuffix: () {
                          controller.isPasswordVisible.toggle();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mana password lu?';
                          }
                          if (value.length < 8) {
                            return 'Minimal 8 karakter ya';
                          }

                          return null;
                        })
                    .animate(
                      delay: const Duration(milliseconds: 300),
                    )
                    .slideX(
                      begin: 1,
                      end: 0,
                    ),
                const SizedBox(height: 15),
                XTextField(
                  prefixIcon: MdiIcons.lockOutline,
                  labelText: 'Confirm Password',
                  hintText: '********',
                  suffixIcon: controller.isPasswordVisible.value
                      ? MdiIcons.eyeOutline
                      : MdiIcons.eyeOffOutline,
                  onPressSuffix: () {
                    controller.isPasswordVisible.toggle();
                  },
                  onChanged: (value) {
                    controller.user.value.confirmPassword = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Mana password lu?';
                    }
                    if (value.length < 8) {
                      return 'Minimal 8 karakter ya';
                    }
                    if (value != controller.user.value.password) {
                      return 'Password nya ga sama';
                    }

                    return null;
                  },
                  obscureText: controller.isPasswordVisible.value,
                )
                    .animate(
                      delay: const Duration(milliseconds: 300),
                    )
                    .slideX(
                      begin: -1,
                      end: 0,
                    ),
              ],
            );
          }),
          const SizedBox(height: 15),
          Obx(() {
            return controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : XButton(
                    onPressed: () {
                      controller.signUp();
                    },
                    animationDuration: const Duration(milliseconds: 500),
                    child: Text(
                      'Daftar',
                      style: Get.theme.textTheme.titleLarge!.copyWith(
                        color: ThemeApp().lightColor,
                      ),
                    ),
                  );
          })
              .animate(
                delay: const Duration(milliseconds: 300),
              )
              .slideX(
                begin: 1,
                end: 0,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                  child: Divider(
                thickness: 2,
              )),
              const SizedBox(width: 10),
              Text(
                'atau',
                style: Get.theme.textTheme.bodyLarge!
                    .copyWith(color: ThemeApp().darkTextColor),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Divider(
                  thickness: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          XButton(
            backgroundColor: ThemeApp().darkColor,
            onPressed: () async {
              await controller.authService.signInWithGoogle();
            },
            animationDuration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.google,
                  color: ThemeApp().lightColor,
                ),
                const SizedBox(width: 10),
                Text(
                  'Daftar pake Google',
                  style: Get.theme.textTheme.titleLarge!.copyWith(
                    color: ThemeApp().lightColor,
                  ),
                ),
              ],
            ),
          )
              .animate(
                delay: const Duration(milliseconds: 300),
              )
              .slideX(
                begin: -1,
                end: 0,
              ),
        ],
      ).animate().fade(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 200),
          ),
    );
  }
}
