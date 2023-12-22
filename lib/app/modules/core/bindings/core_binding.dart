import 'package:get/get.dart';
import 'package:iamtif/app/modules/home/controllers/home_controller.dart';

import '../controllers/core_controller.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoreController>(
      () => CoreController(),
    );
    Get.lazyPut(() => HomeController());
  }
}
