// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/logger.dart';
import 'package:iamtif/app/common/x_notifier.dart';
import 'package:iamtif/app/models/user_model.dart';
import 'package:iamtif/app/services/firebase/firebase_auth_service.dart';

class AuthController extends GetxController with GetTickerProviderStateMixin {
  final isLoginForm = true.obs;
  late final tabController;
  late final scrollController;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;
  final authService = Get.find<FirebaseAuthService>();
  Rx<UserModel> user = Rx<UserModel>(UserModel(
    name: '',
    email: '',
    password: '',
  ));
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
    );
    tabController.addListener(() {
      isLoginForm.value = tabController.index == 0;
    });
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
            // Logger.info("Sign up with email and password success");
            XNotifier.snackMessage(
              title: 'Dah Berhasil',
              messages: 'Alooo!',
              type: XNotifierType.success,
            );
            tabController.animateTo(0);
          },
          onError: (error) {
            Logger.error("Error sign up with email and password: $error");
            XNotifier.snackMessage(
              title: 'Error',
              messages: error,
              type: XNotifierType.error,
            );
          },
        );
      } catch (e) {
        print("catch on controller signup $e");
      } finally {
        isLoading(false);
      }
    }
  }

  void signIn() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      try {
        isLoading(true);
        await authService.signInWithEmailAndPassword(
          userModel: user.value,
          onLoading: isLoading,
          onSuccess: (usr) {
            XNotifier.snackMessage(
              title: 'Dah Berhasil',
              messages: 'Alooo Gess!',
              type: XNotifierType.success,
            );
          },
          onError: (error) {
            print("====================================");
            print("Error sign in with email and password: $error");
            XNotifier.snackMessage(
              title: 'Error',
              messages: error,
              type: XNotifierType.error,
            );
          },
        );
      } catch (e) {
        XNotifier.snackMessage(
          title: 'Error',
          messages: e.toString(),
          type: XNotifierType.error,
        );
      } finally {
        isLoading(false);
      }
    }
  }
}
