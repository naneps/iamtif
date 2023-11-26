import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class XNotifier {
  static snackMessage({
    required String title,
    required String? messages,
    required XNotifierType type,
    int seconds = 3,
    bool isDismissible = true,
    bool isCloseButton = true,
    bool hasIcon = true,
    SnackPosition snackPosition = SnackPosition.TOP,
  }) {
    Get.snackbar(
      title,
      messages!,
      snackPosition: snackPosition,
      titleText: Text(
        title,
        style: TextStyle(
          color: ThemeApp().darkTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: Icon(
        handleTypeIcon(type),
        color: handleTypeColor(type),
        size: 35,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      messageText: Text(
        messages,
        style: TextStyle(
          color: ThemeApp().darkTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      barBlur: 20,
      leftBarIndicatorColor: handleTypeColor(type),
      overlayColor: Colors.black.withOpacity(0.2),
      shouldIconPulse: true,
      borderColor: handleTypeColor(type),
      borderWidth: 1,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      dismissDirection: DismissDirection.horizontal,
      duration: Duration(seconds: seconds),
      maxWidth: Get.width,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeOutQuart,
    );
  }

  static Color handleTypeColor(XNotifierType type) {
    Color? color;
    switch (type) {
      case XNotifierType.info:
        color = ThemeApp().infoColor;
        break;
      case XNotifierType.error:
        color = ThemeApp().dangerColor;
        break;
      case XNotifierType.success:
        color = ThemeApp().successColor;
        break;
      case XNotifierType.warning:
        color = ThemeApp().warningColor;
        break;

      default:
        color = ThemeApp().primaryColor;
        break;
    }
    return color;
  }

  static IconData handleTypeIcon(XNotifierType type) {
    IconData? icon;
    switch (type) {
      case XNotifierType.error:
        icon = MdiIcons.closeCircle;
        break;
      case XNotifierType.info:
        icon = MdiIcons.checkCircle;
        break;
      case XNotifierType.success:
        icon = MdiIcons.alertCircle;
        break;
      case XNotifierType.warning:
        icon = MdiIcons.informationOutline;
        break;
    }

    return icon;
  }
}

enum XNotifierType {
  success,
  error,
  warning,
  info,
}

class XNotifierModel {
  final String title;
  final String message;
  final XNotifierType type;

  XNotifierModel({
    required this.title,
    required this.message,
    required this.type,
  });
}
