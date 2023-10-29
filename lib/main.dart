import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "iamtif",
      initialRoute: Routes.AUTH,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp().themeData,
    ),
  );
}
