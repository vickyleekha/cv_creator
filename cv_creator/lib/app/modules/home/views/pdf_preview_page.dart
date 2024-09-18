import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/utils/make_pdf.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final List<ExperienceModel> expList;
  final List<String> expertise;
  final List<List<String>> education;
  final List<String> language;
  final String name, path, email, phone, address, intro, post;
  const PdfPreviewPage(
      {super.key,
      required this.name,
      required this.path,
      required this.expList,
      required this.expertise,
      required this.education,
      required this.language,
      required this.email,
      required this.phone,
      required this.address,
      required this.intro,
      required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        onError: (cont, error) {
          return Text(error.toString());
        },
        pdfFileName: "$name.pdf",
        canChangeOrientation: false,
        canDebug: false,
        canChangePageFormat: false,
        actionBarTheme: const PdfActionBarTheme(
            backgroundColor: Color.fromRGBO(244, 67, 54, 1)),
        build: (context) => makePdf("name", "email", "phone", "address",
            "intro", "post", path, expList, expertise, education, language),
      ),
    );
  }
}
