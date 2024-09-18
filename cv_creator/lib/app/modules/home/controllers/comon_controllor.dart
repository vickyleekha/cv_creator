import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  Rx<List<String>> commonList = Rx<List<String>>([]);
  TextEditingController textEditingController = TextEditingController();

  late ExperienceModel experienceModel;
  var itemCount = 0.obs;

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }

  addCommon(String commnon) {
    commonList.value.add(commnon);
    itemCount.value = commonList.value.length;
    textEditingController.clear();
  }

  removeEmployee(int index) {
    commonList.value.removeAt(index);
    itemCount.value = commonList.value.length;
  }
}
