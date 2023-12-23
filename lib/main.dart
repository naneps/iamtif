import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamtif/app/common/theme.dart';
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
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      onInit: () {
        // Get.put(CloudMessagingService());
        // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
        // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
        // FirebaseAuth.instance.authStateChanges().listen((User? user) {
        //   if (user == null) {
        //     print('User is currently signed out!');
        //     Get.offAllNamed(Routes.AUTH);
        //   } else {
        //     print('User is signed in!');
        //     Get.offAllNamed(Routes.CORE);
        //   }
        // });
      },
      theme: ThemeApp().themeData,
    ),
  );
}
