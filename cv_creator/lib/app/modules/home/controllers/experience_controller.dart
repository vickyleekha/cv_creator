import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExperienceController extends GetxController {
  Rx<List<ExperienceModel>> experience = Rx<List<ExperienceModel>>([]);
  TextEditingController yearTextEditingController = TextEditingController();
  TextEditingController compTextEditingController = TextEditingController();
  TextEditingController poitionTextEditingController = TextEditingController();
  TextEditingController expTextEditingController = TextEditingController();
  late ExperienceModel experienceModel;
  var itemCount = 0.obs;

  @override
  void onClose() {
    super.onClose();
    yearTextEditingController.dispose();
    compTextEditingController.dispose();
    poitionTextEditingController.dispose();
    expTextEditingController.dispose();
  }

  addEmployee(String year, companyName, jobPosition, experienceDetails) {
    experienceModel = ExperienceModel(
      year: year,
      companyName: companyName,
      jobPosition: jobPosition,
      experienceDetails: experienceDetails,
    );
    experience.value.add(experienceModel);
    itemCount.value = experience.value.length;
    yearTextEditingController.clear();
    compTextEditingController.clear();
    poitionTextEditingController.clear();
    expTextEditingController.clear();
  }

  removeEmployee(int index) {
    experience.value.removeAt(index);
    itemCount.value = experience.value.length;
  }
}
