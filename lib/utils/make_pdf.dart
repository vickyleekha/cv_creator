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

  List<Widget> widgets = [];
  final image = MemoryImage(uint8list);
  Widget page1 = Container(
      // height: 800,
      child: Row(children: [
    Container(
        width: 200,
        padding: const EdgeInsets.only(left: 20, top: 20),
        color: PdfColor.fromHex("#30394A"),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text('Contact', style: whiteTextStyle20())),
          line(),
          Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Text('Phone', style: whiteTextStyle20())),
          Text(phone, style: whiteTextStyle16()),
          Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Text('Email', style: whiteTextStyle20())),
          Text(email, style: whiteTextStyle16()),
          Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Text('Address', style: whiteTextStyle20())),
          Text(address, style: whiteTextStyle16()),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text('Education', style: whiteTextStyle20())),
          line(),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: education.length,
                  itemBuilder: (context, i) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(education[i][0],
                              style: const TextStyle(
                                  color: PdfColors.white, fontSize: 14)),
                          Text(education[i][1], style: whiteTextStyle20()),
                          Text(education[i][2],
                              style: const TextStyle(
                                  color: PdfColors.white, fontSize: 16))
                        ]);
                  })),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text('Expertise', style: whiteTextStyle20())),
          line(),
          Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            circle4(),
                            Text(expertise[i],
                                style: const TextStyle(
                                    color: PdfColors.white, fontSize: 14))
                          ])
                        ]);
                  },
                  itemCount: expertise.length)),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text('Language', style: whiteTextStyle20())),
          line(),
          Container(
              height: 100,
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: ListView.builder(
                  itemBuilder: (context, i) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language[i],
                              style: const TextStyle(
                                  color: PdfColors.white, fontSize: 14))
                        ]);
                  },
                  itemCount: language.length))
        ])),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: const EdgeInsets.only(top: 5, left: 20),
          child: Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PdfColor.fromHex("#30394A"),
                  fontSize: 32))),
      Container(
          margin: const EdgeInsets.only(top: 5, left: 20),
          child: Text(post,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PdfColor.fromHex("#30394A"),
                  fontSize: 24))),
      Container(
        width: 500,
        margin: const EdgeInsets.only(top: 5, left: 20),
        child: Text(intro, style: greyTextStyle14()),
      ),
      Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: Text('Experience', style: blueTextStyle20())),
      bigLine(),
      Container(
          width: 500,
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: ListView.builder(
              direction: Axis.vertical,
              itemBuilder: (context, i) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expList[i].year!, style: blueTextStyle16()),
                      Text(expList[i].companyName!, style: greyTextStyle14()),
                      Text(expList[i].jobPosition!, style: blueTextStyle16()),
                      Text(expList[i].experienceDetails!,
                          style: greyTextStyle14())
                    ]);
              },
              itemCount: expList.length)),
      Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: Text('Reference', style: blueTextStyle20())),
      bigLine()
    ])
  ]));

  final pdf = Document();
  widgets.add(page1);

  Widget page2 = Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: 800,
            width: 200,
            color: PdfColor.fromHex("#30394A"),
            child: Column(children: [Text("text", style: whiteTextStyle20())])),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [])
      ]);

  widgets.add(page2);

  pdf.addPage(
    MultiPage(
      pageFormat:
          // PdfPageFormat.a4,
          const PdfPageFormat(800, 1000),
      orientation: PageOrientation.portrait,
      build: (context) {
        return widgets;
      },
    ),
  );
  return pdf.save();
}
