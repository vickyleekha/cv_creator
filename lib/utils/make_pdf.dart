import 'dart:convert';
import 'dart:io';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/utils/pdf_utility.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(
    String name,
    email,
    phone,
    address,
    intro,
    post,
    path,
    final List<ExperienceModel> expList,
    List<String> expertise,
    List<List<String>> education,
    List<String> language) async {
  //converting file to unit8list
  List<int> imageBase64 = File(path).readAsBytesSync();
  String imageAsString = base64Encode(imageBase64);
  Uint8List uint8list = base64.decode(imageAsString);
  final image = MemoryImage(uint8list);

  List<Widget> widgets = [];
  Widget page1 = Partitions(children: <Partition>[
    Partition(
        flex: 2000,
        child: Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              imageContainer(image),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text('Contact', style: whiteTextStyle20())),
              line(),
              Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('Phone', style: whiteTextStyle20())),
              Text(phone, style: whiteTextStyle16()),
              Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('Email', style: whiteTextStyle20())),
              Text(email, style: whiteTextStyle16()),
              Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('Address', style: whiteTextStyle20())),
              Text(address, style: whiteTextStyle16()),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text('Education', style: whiteTextStyle20())),
              line(),
              educationContainer(education),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text('Expertise', style: whiteTextStyle20())),
              line(),
              expertiseContainer(expertise),
              Container(child: Text('Language', style: whiteTextStyle20())),
              line(),
              langContainer(language)
            ]))),
    Partition(
        flex: 2000,
        child: Container(
            margin:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(name, style: blueTextStyle(32.0))),
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(post, style: blueTextStyle(24.0))),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(intro, style: greyTextStyle14()),
              ),
              Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text('Experience', style: blueTextStyle20())),
              bigLine(),
              expContainer(expList),
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                      overflow: TextOverflow.visible,
                      '  ${'Referencec'}',
                      style: blueTextStyle20())),
              bigLine()
            ])))
  ]);
  widgets.add(page1);

  final pdf = Document();
  pdf.addPage(
    MultiPage(
      pageTheme: PageTheme(
          margin: const EdgeInsets.all(0),
          pageFormat: PdfPageFormat.a4,
          orientation: PageOrientation.portrait,
          buildBackground: (Context context) => Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    color: PdfColor.fromHex("#30394A"),
                  ),
                ),
                Expanded(flex: 7, child: Container()),
              ])),
      build: (context) {
        return widgets;
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.black)));
      },
    ),
  );
  return pdf.save();
}
