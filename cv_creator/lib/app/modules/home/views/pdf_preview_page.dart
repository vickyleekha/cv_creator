import 'package:cv_creator/app/data/model/education_model.dart';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/utils/resume/make_pdf.dart';
import 'package:cv_creator/utils/resume/tech_pdf.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:cv_creator/utils/resume/grey_resume.dart';
import 'package:cv_creator/utils/resume/new_pdf.dart';
import 'package:cv_creator/utils/resume/pdf_green.dart';
import 'package:cv_creator/utils/resume/red_heading.dart';
import 'package:cv_creator/utils/resume/simple_resume.dart';
import 'package:cv_creator/utils/resume/skill_based.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfPreviewPage extends StatelessWidget {
  final int index;
  final List<ExperienceModel>? expList;

  final List<EducationModel>? education;

  const PdfPreviewPage({
    super.key,
    required this.index,
    this.expList,
    this.education,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> resPDf = [
      makePdf(expList, education),
      generateCV(),
      generateSkillBasedResumePdf(),
      generateGreyResumePdf(),
      generateResumePdf(),
      generateRedResumePdf(),
      createPDF(),
      generateGreenResumePdf(),
    ];

    return Scaffold(
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
          build: (context) => resPDf[index]),
    );
  }
}

name() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('name');
}
