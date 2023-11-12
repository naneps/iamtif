import 'package:get/get.dart';
import 'package:iamtif/app/services/firebase/firebase_auth_service.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthService());
  }
}
