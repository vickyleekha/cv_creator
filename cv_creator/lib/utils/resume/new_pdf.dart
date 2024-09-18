import 'package:cv_creator/utils/pdf_utility.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

//  pw.CustomPaint(
//               size: const PdfPoint(110, 110),
//               painter: (PdfGraphics canvas, PdfPoint size) {
//                 canvas..
//                   setColor(PdfColors.indigo)
//                   ..drawRect(10, 10, 100, 100)
//                   ..fillPath();
//               },
//             ),

Future<Uint8List> generateCV() async {
  final pdf = pw.Document();
  final ByteData image = await rootBundle.load('assets/profile_image.jpg');
  final ByteData image1 = await rootBundle.load('assets/bgnew.jpg');

  Uint8List imageData = (image).buffer.asUint8List();
  Uint8List bg = (image1).buffer.asUint8List();
  List<String> list = [
    'Adobe Photoshop',
    ' Adobe Illustrator',
    ' Microsoft Word',
    'HTML/CSS'
  ];

  // Adding the page
  pdf.addPage(
    pw.MultiPage(
      pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          buildBackground: (c) => pw.FullPage(
              ignoreMargins: true,
              child: imageContainerWHBG(pw.MemoryImage(bg),
                  PdfPageFormat.a4.width, PdfPageFormat.a4.height))),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Left side (Contact Info, References, Education)

              pw.Container(
                width: 150,
                // color: PdfColor.fromHex('#232323'),
                padding: const pw.EdgeInsets.only(left: 20, top: 20),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Profile Image
                    pw.Container(
                      width: 80,
                      height: 80,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        border: pw.Border.all(
                            color: PdfColors.white,
                            // PdfColor.fromHex('#FFB300'),
                            width: 4),
                      ),
                      child: imageContainerWH(
                          pw.MemoryImage(imageData), 70.0, 70.0),
                    ),

                    pw.SizedBox(height: 20),

                    // Contact Info
                    pw.Text(
                      'CONTACT ME',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      'Phone: +1-234-567-890\nEmail: yourinfo@gmail.com\nWebsite: www.yourwebsite.com\nAddress: 123 Street, City',
                      style: const pw.TextStyle(
                          fontSize: 10, color: PdfColors.white),
                    ),
                    pw.SizedBox(height: 20),

                    // References
                    pw.Text(
                      'REFERENCES',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      'Darwin B. Magana\nRobert J. Belvin',
                      style: const pw.TextStyle(
                          fontSize: 10, color: PdfColors.white),
                    ),
                    pw.SizedBox(height: 20),

                    // Education
                    pw.Text(
                      'EDUCATION',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      'Stanford University\nMaster\'s Degree\n2011-2013\n\nUniversity of Chicago\nBachelor\'s Degree\n2007-2010',
                      style: const pw.TextStyle(
                          fontSize: 10, color: PdfColors.white),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(width: 20),

              // Right side (About Me, Job Experience, Skills)
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Name and Title
                    pw.Text(
                      'BRIAN R. BAXTER',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Graphic & Web Designer',
                      style: pw.TextStyle(
                        fontSize: 16,
                        color: PdfColor.fromHex('#FFB300'),
                      ),
                    ),
                    pw.SizedBox(height: 20),

                    // About Me
                    pw.Text(
                      'ABOUT ME',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text since the 1500s.',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                    pw.SizedBox(height: 20),

                    // Job Experience
                    pw.Text(
                      'JOB EXPERIENCE',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 10),

                    pw.Text(
                      'Senior Web Designer\nCreative Agency / Chicago\n2020-Present',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                    pw.SizedBox(height: 10),

                    pw.Text(
                      'Graphic Designer\nCreative Market / Chicago\n2015-2020',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                    pw.SizedBox(height: 10),

                    pw.Text(
                      'Marketing Manager\nManufacturing Agency / NJ\n2013-2015',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                    pw.SizedBox(height: 20),

                    // Skills
                    pw.Text(
                      'SKILLS',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 10),

                    pw.ListView.builder(
                        itemBuilder: (con, i) => pw.Row(children: [
                              circleBlack(),
                              pw.Text(
                                list[i].toString(),
                                style: const pw.TextStyle(fontSize: 10),
                              )
                            ]),
                        itemCount: list.length)
                  ],
                ),
              ),
            ],
          )
        ];
      },
    ),
  );

  return pdf.save();
}





// yai imlement krna sikhna hai

                  // pw.Text(
                  //   '• Flutter & Dart\n• JavaScript & React\n• Node.js & Express\n• Git & CI/CD',
                  //   style: const pw.TextStyle(fontSize: 10),
                  // ),

// Future<pw.PageTheme> pageTheme() async {
//   final materialIcons = await rootBundle.load("assets/materialIcons.ttf");

//   final materialIconsTtf = pw.Font.ttf(materialIcons);
//   return pw.PageTheme(
//     margin: pw.EdgeInsets.zero,
//     pageFormat: PdfPageFormat.a4,
//     theme: pw.ThemeData.withFont(
//       icons: materialIconsTtf,
//     ),
//   );
// }
