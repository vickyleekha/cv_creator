import 'package:cv_creator/app/modules/home/controllers/education_controller.dart';
import 'package:cv_creator/app/modules/home/views/edit_profile.dart';
import 'package:cv_creator/utils/utill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.yearTextEditingController,
              decoration: decoration(
                  hintText: "Year",
                  string: controller.yearTextEditingController.text),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.orgTextEditingController,
              decoration: decoration(
                  hintText: "Org Name",
                  string: controller.orgTextEditingController.text),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.courseTextEditingController,
              decoration: decoration(
                  hintText: "Course",
                  string: controller.courseTextEditingController.text),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                controller.addEDucation(
                  controller.yearTextEditingController.text,
                  controller.orgTextEditingController.text,
                  controller.courseTextEditingController.text,
                );
              },
              child: const Text("Add Employee"),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.itemCount.value,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(controller.education.value[index].year!),
                        subtitle:
                            Text(controller.education.value[index].orgName!),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            controller.removeEmployee(index);
                          },
                        ),
                      );
                    }),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(EditProfile(eduList: controller.education.value));
                },
                child: const Text("edit"))
          ],
        ),
      ),
    );
  }
}
