import 'package:cv_creator/app/modules/home/controllers/comon_controllor.dart';
import 'package:cv_creator/app/modules/home/controllers/education_controller.dart';
import 'package:get/get.dart';

import '../controllers/experience_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExperienceController>(
      () => ExperienceController(),
    );
    Get.lazyPut<CommonController>(() => CommonController());
    Get.lazyPut<EducationController>(() => EducationController());
  }
}
