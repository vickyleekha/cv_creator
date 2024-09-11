import 'package:cv_creator/app/modules/home/views/edit_profile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
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
              decoration: const InputDecoration(
                hintText: "Year",
                labelText: "Year",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.compTextEditingController,
              decoration: const InputDecoration(
                hintText: "Company Name",
                labelText: "Company Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.poitionTextEditingController,
              decoration: const InputDecoration(
                hintText: "Job Postion",
                labelText: "Job Postion",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.expTextEditingController,
              decoration: const InputDecoration(
                hintText: "exp",
                labelText: "exp",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
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
