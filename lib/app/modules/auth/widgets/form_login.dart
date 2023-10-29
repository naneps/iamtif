import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/buttons/x_button.dart';
import 'package:iamtif/app/common/input/x_field.dart';
import 'package:iamtif/app/common/theme.dart';
import 'package:iamtif/app/modules/auth/controllers/auth_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Login Lah',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fade(),
        const SizedBox(height: 15),
        XTextField(
          prefixIcon: MdiIcons.emailOutline,
          labelText: 'Email',
          hintText: 'jhonDoe@xxx.com',
        )
            .animate(
              delay: const Duration(milliseconds: 300),
            )
            .slideX(
              begin: -1,
              end: 0,
            ),
        const SizedBox(height: 15),
        XTextField(
          prefixIcon: MdiIcons.lockOutline,
          labelText: 'Password',
          hintText: '********',
          obscureText: true,
        )
            .animate(
              delay: const Duration(milliseconds: 300),
            )
            .slideX(
              begin: 1,
              end: 0,
            ),
        const SizedBox(height: 15),
        XButton(
          onPressed: () {},
          animationDuration: const Duration(milliseconds: 500),
          child: Text(
            'Login',
            style: Get.theme.textTheme.titleLarge!.copyWith(
              color: ThemeApp().lightColor,
            ),
          ),
        )
            .animate(
              delay: const Duration(milliseconds: 300),
            )
            .slideX(
              begin: -1,
              end: 0,
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun? ',
              style: Get.theme.textTheme.bodyLarge!
                  .copyWith(color: ThemeApp().darkTextColor),
            ),
            TextButton(
              onPressed: () {
                Get.find<AuthController>().isLogin.value = false;
                Future.delayed(const Duration(milliseconds: 200), () {
                  Get.find<AuthController>().tabController.animateTo(1);
                });
              },
              child: Text(
                'Daftar sini',
                style: Get.theme.textTheme.titleSmall!
                    .copyWith(color: ThemeApp().primaryColor),
              ),
            ),
            // atau
          ],
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
                onPressed: () {},
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
                      'Login pake Google',
                      style: Get.theme.textTheme.titleLarge!.copyWith(
                        color: ThemeApp().lightColor,
                      ),
                    ),
                  ],
                ))
            .animate(
              delay: const Duration(milliseconds: 300),
            )
            .slideX(
              begin: 1,
              end: 0,
            ),
      ],
    ).animate().fade(
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 200),
        );
  }
}
