import 'dart:convert';
import 'dart:io';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/utils/pdf_utility.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/material.dart' as m;

import 'utill.dart';

Future<Uint8List> makePdf(
    String name,
    email,
    phone,
    address,
    intro,
    post,
    // path,
    // final List<ExperienceModel> expList,
    List<String> expertise,
    List<List<String>> education,
    List<String> language) async {
  //converting file to unit8list
  // List<int> imageBase64 = File(path).readAsBytesSync();
  // String imageAsString = base64Encode(imageBase64);
  // Uint8List uint8list = base64.decode(imageAsString);
  // final image = MemoryImage(uint8list);

  String text =
      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.,There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";

  Widget page1 = Partitions(children: <Partition>[
    Partition(
        flex: 3,
        child: Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // imageContainer(image),
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
            ]))),
    Partition(
        flex: 7,
        child: Container(
            margin:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Column(children: [
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
              // expContainer(expList),
              Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text('ref', style: blueTextStyle20())),
            ])))
  ]);
  // widgets.add(page1);

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
                    color:
                        // PdfColors.red,
                        PdfColor.fromHex("#30394A"),
                  ),
                ),
                Expanded(flex: 7, child: Container()),
              ])),
      build: (context) => <Widget>[
        page1,
        Partitions(children: [
          Partition(
            flex: 3,
            child: langContainer(language),
          ),
          Partition(
            flex: 7,
            child: Paragraph(text: text),
          )
        ]),
        Header(
            level: 0,
            title: 'Portable Document Format',
            outlineColor: PdfColors.deepOrange,
            decoration: const BoxDecoration(color: PdfColors.amber),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Portable Document Format', textScaleFactor: 2),
                  PdfLogo()
                ])),
        Bullet(
            text: "I am Vicky",
            style: const TextStyle(color: PdfColors.red, fontSize: 16)),
        Partitions(children: [
          // Partition(flex: 3, child: Text("text")),
          Partition(
            flex: 7,
            child: Paragraph(text: text),
          )
        ]),
        Bullet(
            text: "I am Vicky",
            style: TextStyle(color: PdfColors.red, fontSize: 16)),
        Paragraph(text: text),
        Bullet(
          text: "I am Vicky",
        ),
        Center(
            child: Text("text",
                style: TextStyle(color: PdfColors.red, fontSize: 28))),
        MultiLineText(
          text:
              " This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.",
          textStyle: const TextStyle(
              fontSize: 16), // Default text style (without color)
          lineColors: [
            PdfColors.red,
            PdfColors.green,
            PdfColors.blue,
            PdfColors.purple
          ], // List of colors for each line
        ),
      ],
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





  // widgets.add();
  // widgets.add(Partitions(children: [
  //   Partition(
  //     flex: 3,
  //     child:
  //         // Wrap(children: [
  //         ListView.builder(
  //             direction: Axis.vertical,
  //             itemBuilder: (con, ind) {
  //               return Container(
  //                   color: ind.isEven ? PdfColors.red : PdfColors.blue,
  //                   child: Text(text.split(',')[ind].toString(),
  //                       style: const TextStyle(
  //                           color: PdfColors.white, fontSize: 15)));
  //             },
  //             itemCount: text.split(',').length),
  //     // ])
  //   ),
  //   Partition(
  //     flex: 7,
  //     child: MultiLineText(
  //       text:
  //           " This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.",
  //       textStyle:
  //           const TextStyle(fontSize: 16), // Default text style (without color)
  //       lineColors: [
  //         PdfColors.red,
  //         PdfColors.green,
  //         PdfColors.blue,
  //         PdfColors.purple
  //       ], // List of colors for each line
  //     ),
  //   )
  // ]));