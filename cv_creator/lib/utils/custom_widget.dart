import 'package:cv_creator/app/data/model/education_model.dart';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/app/modules/home/views/pdf_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

gridViewImages(List<String> imageList, List<EducationModel>? eduList,
        List<ExperienceModel>? expList) =>
    GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        itemCount: imageList.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
              onTap: () {
                Get.to(PdfPreviewPage(
                    index: index,
                    expList: expList,
                    education: eduList)); // Call the method to generate the PDF
              },
              child: Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(imageList[index])),
                ),
              ));
        });
