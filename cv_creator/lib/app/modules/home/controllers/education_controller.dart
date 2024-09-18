import 'package:cv_creator/app/data/model/education_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  Rx<List<EducationModel>> education = Rx<List<EducationModel>>([]);
  TextEditingController yearTextEditingController = TextEditingController();
  TextEditingController orgTextEditingController = TextEditingController();
  TextEditingController courseTextEditingController = TextEditingController();
  late EducationModel educationModel;
  var itemCount = 0.obs;

  @override
  void onClose() {
    super.onClose();
    yearTextEditingController.dispose();
    orgTextEditingController.dispose();
    courseTextEditingController.dispose();
  }

  addEDucation(String year, orgName, course) {
    educationModel = EducationModel(
      year: year,
      orgName: orgName,
      course: course,
    );
    education.value.add(educationModel);
    itemCount.value = education.value.length;
    yearTextEditingController.clear();
    orgTextEditingController.clear();
    courseTextEditingController.clear();
  }

  removeEmployee(int index) {
    education.value.removeAt(index);
    itemCount.value = education.value.length;
  }
}
