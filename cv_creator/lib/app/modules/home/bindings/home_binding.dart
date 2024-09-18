import 'package:cv_creator/app/modules/home/controllers/comon_controllor.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CommonController>(() => CommonController());
  }
}
