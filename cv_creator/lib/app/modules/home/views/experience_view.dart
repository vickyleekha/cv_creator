import 'package:cv_creator/app/modules/home/views/edit_profile.dart';
import 'package:cv_creator/utils/utill.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/experience_controller.dart';

class ExperienceView extends GetView<ExperienceController> {
  const ExperienceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience Details'),
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
              controller: controller.compTextEditingController,
              decoration: decoration(
                  hintText: "Company Name",
                  string: controller.compTextEditingController.text),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.poitionTextEditingController,
              decoration: decoration(
                  hintText: "Job Postion",
                  string: controller.poitionTextEditingController.text),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.expTextEditingController,
              decoration: decoration(
                  hintText: "Experience Details",
                  string: controller.expTextEditingController.text),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                controller.addEmployee(
                    controller.yearTextEditingController.text,
                    controller.compTextEditingController.text,
                    controller.poitionTextEditingController.text,
                    controller.expTextEditingController.text);
              },
              child: const Text("Add Employee"),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.itemCount.value,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(controller.experience.value[index].year!),
                        subtitle: Text(controller
                            .experience.value[index].experienceDetails!),
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
                  Get.to(EditProfile(expList: controller.experience.value));
                },
                child: const Text("edit"))
          ],
        ),
      ),
    );
  }
}
