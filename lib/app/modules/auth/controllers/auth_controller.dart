// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/x_notifier.dart';
import 'package:iamtif/app/models/user_model.dart';
import 'package:iamtif/app/services/firebase/firebase_auth_service.dart';

class AuthController extends GetxController with GetTickerProviderStateMixin {
  final isLogin = true.obs;
  late final tabController;
  late final scrollController;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  final authService = Get.find<FirebaseAuthService>();
  Rx<UserModel> user = Rx<UserModel>(UserModel());
  final registerFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
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

  void signUp() async {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      try {
        isLoading(true);
        await authService.signUpWithEmailAndPassword(
          user.value,
          onLoading: isLoading,
          onSuccess: (usr) {
            XNotifier.snackMessage(
              title: 'Dah Berhasil',
              messages: 'Alooo, ${usr.displayName}!',
              type: XNotifierType.success,
              seconds: 0.7,
            );
            tabController.animateTo(0);
            user.update((user) {
              user!.name = usr.displayName!;
              user.email = usr.email!;
            });
          },
          onError: (error) {
            XNotifier.snackMessage(
              title: 'Error',
              messages: error,
              type: XNotifierType.error,
              seconds: 0.7,
            );
          },
        );
      } catch (e) {
        XNotifier.snackMessage(
          title: 'Error',
          messages: e.toString(),
          type: XNotifierType.error,
          seconds: 0.7,
        );
      } finally {
        isLoading(false);
      }
    }
  }
}
