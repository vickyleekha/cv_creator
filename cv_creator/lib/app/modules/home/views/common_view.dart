import 'package:cv_creator/app/modules/home/controllers/comon_controllor.dart';
import 'package:cv_creator/app/modules/home/views/edit_profile.dart';
import 'package:cv_creator/utils/utill.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CommonView extends GetView<CommonController> {
  const CommonView({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('$data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.textEditingController,
              decoration: decoration(
                  hintText: "$data",
                  string: controller.textEditingController.text),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                controller.addCommon(
                  controller.textEditingController.text,
                );
              },
              child: Text("Add $data"),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.itemCount.value,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(controller.commonList.value[index]),
                        // subtitle: Text(controller
                        //     .commonList.value[index].!),
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
                  Get.to(EditProfile(comList: controller.commonList.value));
                },
                child: const Text("edit"))
          ],
        ),
      ),
    );
  }
}
