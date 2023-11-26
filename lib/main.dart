import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/theme.dart';
import 'package:iamtif/app/services/firebase/cloud_messaging_service.dart';
import 'package:iamtif/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      title: "iamtif",
      initialRoute: Routes.AUTH,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      onInit: () {
        Get.put(CloudMessagingService());
        FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      },
      theme: ThemeApp().themeData,
    ),
  );
}
