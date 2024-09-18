import 'package:cv_creator/utils/resume/tech_pdf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:cv_creator/utils/resume/grey_resume.dart';
import 'package:cv_creator/utils/resume/new_pdf.dart';
import 'package:cv_creator/utils/resume/pdf_green.dart';
import 'package:cv_creator/utils/resume/red_heading.dart';
import 'package:cv_creator/utils/resume/simple_resume.dart';
import 'package:cv_creator/utils/resume/skill_based.dart';

List<dynamic> resPDf = [
  generateCV(),
  generateSkillBasedResumePdf(),
  generateGreyResumePdf(),
  generateResumePdf(),
  generateRedResumePdf(),
  generateGreenResumePdf(),
  createPDF()
];

gridViewImages(List<String> imageList) => GridView.builder(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1),
    itemCount: imageList.length,
    itemBuilder: (BuildContext ctx, index) {
      return InkWell(
          onTap: () {
            Get.to(Scaffold(
                appBar: AppBar(
                  title: const Text('PDF Preview'),
                ),
                body: PdfPreview(
                    onError: (cont, error) {
                      return Text(error.toString());
                    },
                    pdfFileName: "name.pdf",
                    canChangeOrientation: false,
                    canDebug: false,
                    canChangePageFormat: false,
                    actionBarTheme: const PdfActionBarTheme(
                        backgroundColor: Color.fromRGBO(244, 67, 54, 1)),
                    build: (context) =>
                        resPDf[index]))); // Call the method to generate the PDF
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
