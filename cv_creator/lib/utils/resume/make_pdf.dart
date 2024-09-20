import 'dart:convert';
import 'dart:io';

import 'package:cv_creator/app/data/model/education_model.dart';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/utils/pdf_utility.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Uint8List> makePdf(
  List<ExperienceModel>? expList,
  List<EducationModel>? education,
) async {
  String name, email, phone, address, intro, post, path;
  SharedPreferences preferences = await SharedPreferences.getInstance();

  name = preferences.getString('name')!;
  email = preferences.getString('email')!;
  phone = preferences.getString('phone')!;
  address = preferences.getString('address')!;
  intro = preferences.getString('intro')!;
  post = preferences.getString('post')!;
  path = preferences.getString('path')!;
  List<String> expertise = preferences.getStringList('expertise')!;
  List<String> language = preferences.getStringList('language')!;
  // converting file to unit8list
  List<int> imageBase64 = File(path).readAsBytesSync();
  String imageAsString = base64Encode(imageBase64);
  Uint8List uint8list = base64.decode(imageAsString);
  final image = MemoryImage(uint8list);

  Widget page1 = Partitions(children: <Partition>[
    Partition(
        flex: 3,
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
            ]))),
    Partition(
        flex: 7,
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
              // expContainer(expList),
              Lorem(length: 200),
            ])))
  ]);

  Widget page2 = Partitions(children: [
    Partition(
        flex: 3,
        child: Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(child: Text('Language', style: whiteTextStyle20())),
              line(),
              langContainer(language),
            ]))),
    Partition(
        flex: 7,
        child: Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text('Reference', style: blueTextStyle20())),
              bigLine(),
              Lorem(length: 200),
            ])))
  ]);

  final pdf = Document();

  pdf.addPage(MultiPage(
      pageTheme: PageTheme(
          margin: const EdgeInsets.all(0),
          pageFormat: PdfPageFormat.a4,
          orientation: PageOrientation.portrait,
          buildBackground: (Context context) => Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: PdfColor.fromHex("#30394A"),
                  ),
                ),
                Expanded(flex: 7, child: Container()),
              ])),
      build: (cont) => <Widget>[page1, page2]));
  return pdf.save();
}
//   Partitions(children: [
//     Partition(
//         flex: 1200,
//         child:

//             )
//   ]),
//   Partition(
//       flex: 1000,
//       child: )
// ]);

//     build: (context) => <Widget>[
//       page1,

//       // Partitions(children: [
//       //   Partition(
//       //     flex: 3,
//       //     child: Container(child: langContainer(language)),
//       //   ),
//       //   Partition(
//       //       flex: 7,
//       //       child: Container(
//       //           // constraints: BoxConstraints.expand(),
//       //           child:
//       //               // ListView(children: [
//       //               Padding(
//       //         padding: EdgeInsets.all(8),
//       //         child: MultiLineText(
//       //           text:
//       //               " This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.This is a long paragraph of text that will be split into multiple lines based on the available width. Each line will be a separate Text widget with a different color. Verify that each line has a distinct color and is a separate widget.",
//       //           textStyle: const TextStyle(
//       //               fontSize: 16), // Default text style (without color)
//       //           lineColors: [
//       //             PdfColors.red,
//       //             PdfColors.green,
//       //             PdfColors.blue,
//       //             PdfColors.purple
//       //           ], // List of colors for each line
//       //         ),
//       //       )
//       //           // ])
//       //           ))
//       // ]),
//       // FullPage(ignoreMargins: false, child:

//       //  )
//       //  Wrap(
//       //     direction: Axis.vertical, children: [
//       //       Paragraph(text: text)]))
//       // Header(
//       //     level: 0,
//       //     title: 'Portable Document Format',
//       //     outlineColor: PdfColors.deepOrange,
//       //     decoration: const BoxDecoration(color: PdfColors.amber),
//       //     child: Row(
//       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //         children: <Widget>[
//       //           Text('Portable Document Format', textScaleFactor: 2),
//       //           PdfLogo()
//       //         ])),
//       // Bullet(
//       //     text: "I am Vicky",
//       //     style: const TextStyle(color: PdfColors.red, fontSize: 16)),
//       // Partitions(children: [
//       //   // Partition(flex: 3, child: Text("text")),
//       //   Partition(
//       //     flex: 7,
//       //     child: Paragraph(text: text),
//       //   )
//       // ]),
//       // Wrap(children: [

//       // ])
//     ],
//     // footer: (Context context) {
//     //   return Container(
//     //       alignment: Alignment.centerRight,
//     //       margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
//     //       child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
//     //           style: Theme.of(context)
//     //               .defaultTextStyle
//     //               .copyWith(color: PdfColors.black)));
//     // },
//   ),
// );

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
