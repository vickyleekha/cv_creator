import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart' as mat;
import 'package:printing/printing.dart'; // To use Flutter icons

Future<pw.PageTheme> pageTheme() async {
  // final materialIcons = await rootBundle.load("assets/materialIcons.ttf");

  // final materialIconsTtf = pw.Font.ttf(materialIcons);
  return pw.PageTheme(
      margin: const pw.EdgeInsets.fromLTRB(10, 10, 10, 20),
      pageFormat: PdfPageFormat.a4,
      // theme: pw.ThemeData.withFont(
      //   icons: materialIconsTtf,
      // ),
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.openSansRegular(),
        bold: await PdfGoogleFonts.openSansBold(),
        icons: await PdfGoogleFonts.materialIcons(), // this line
        fontFallback: [await PdfGoogleFonts.notoColorEmoji()],
      ),
      buildBackground: (pw.Context context) => pw.Row(children: [
            pw.Expanded(
                flex: 3,
                child: pw.Container(
                  color:
                      PdfColor.fromHex('#2E3B4E'), // Dark blue left background
                )),
            pw.Expanded(flex: 7, child: pw.Container()),
          ]));
}

Future<Uint8List> generateSkillBasedResumePdf() async {
  final pdf = pw.Document();
  // Load the profile image
  final profileImage = await rootBundle.load('assets/profile_image1.jpg');
  final Uint8List profileImageData = profileImage.buffer.asUint8List();
  pdf.addPage(
    pw.MultiPage(
      pageTheme: await pageTheme(),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Partitions(children: [
            // Left column with profile, skills, education, languages, and interests

            pw.Partition(
              flex: 3,
              child: pw.Container(
                padding: const pw.EdgeInsets.only(
                  left: 30,
                  top: 20,
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Profile Picture
                    pw.Container(
                      width: 100,
                      height: 100,
                      margin: const pw.EdgeInsets.only(bottom: 20),
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        image: pw.DecorationImage(
                          image: pw.MemoryImage(
                            profileImageData,
                          ),
                          fit: pw.BoxFit.cover,
                        ),
                      ),
                    ),

                    // Skills
                    _buildSectionHeader('SKILLS', PdfColors.white),
                    _buildSkillBox('Sales Management'),
                    _buildSkillBox('Revenue Growth'),
                    _buildSkillBox('Customer Service'),
                    _buildSkillBox('Customer Needs Analysis'),
                    _buildSkillBox('Conflict Resolution'),
                    pw.SizedBox(height: 10),

                    // Education
                    _buildSectionHeader('EDUCATION', PdfColors.white),
                    pw.Text(
                      'Associate of Arts in Business Administration\n'
                      'University of Alabama\n'
                      'at Birmingham',
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 10),
                    ),
                    pw.SizedBox(height: 20),

                    // Languages
                    _buildSectionHeader('LANGUAGES', PdfColors.white),
                    pw.Text(
                      'English - Native or Bilingual Proficiency\n'
                      'Spanish - Professional Working Proficiency\n'
                      'French - Professional Working Proficiency',
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 10),
                    ),
                    pw.SizedBox(height: 20),

                    // Interests
                    _buildSectionHeader('INTERESTS', PdfColors.white),
                    pw.Row(children: [
                      pw.Icon(pw.IconData(mat.Icons.email.codePoint),
                          color: PdfColors.white, size: 12),
                      pw.SizedBox(width: 5),
                      pw.Text('Blockchain Technologies',
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 10)),
                    ]),
                    pw.Row(children: [
                      pw.Icon(pw.IconData(mat.Icons.sailing.codePoint),
                          color: PdfColors.white, size: 12),
                      pw.SizedBox(width: 5),
                      pw.Text('Sailing',
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 10)),
                    ]),
                    pw.Row(children: [
                      pw.Icon(pw.IconData(mat.Icons.web.codePoint),
                          color: PdfColors.white, size: 12),
                      pw.SizedBox(width: 5),
                      pw.Text('Web 3.0',
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 10)),
                    ]),
                    pw.Row(children: [
                      pw.Icon(pw.IconData(mat.Icons.sailing.codePoint),
                          color: PdfColors.white, size: 12),
                      pw.SizedBox(width: 5),
                      pw.Text('Sustainability',
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 10)),
                    ]),
                  ],
                ),
              ),
            ),
            pw.Partition(
                flex: 7,
                child: // Right column with name, profile, experience, conferences, and courses
                    pw.Container(
                        margin: const pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            // Name Section
                            pw.Text(
                              'Frank Graham',
                              style: pw.TextStyle(
                                fontSize: 24,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black,
                              ),
                            ),
                            pw.Text(
                              'Sales Associate',
                              style: const pw.TextStyle(
                                fontSize: 18,
                                color: PdfColors.blueGrey600,
                              ),
                            ),
                            pw.SizedBox(height: 10),

                            // Professional Profile
                            pw.Text(
                              'Accomplished, growth-focused professional with 8+ years of dynamic sales experience '
                              'across multiple industries. Equipped with a steadfast commitment to customer service '
                              'excellence to enhance customer experience, maximize satisfaction, propel retention, '
                              'achieve/exceed sales goals, and increase business revenue. Possess superb abilities to '
                              'develop and maintain a high level of product knowledge to persuasively promote them to '
                              'existing and potential customers.',
                              style: const pw.TextStyle(fontSize: 12),
                              textAlign: pw.TextAlign.justify,
                            ),
                            pw.SizedBox(height: 20),

                            // Contact Info
                            pw.Container(
                              color: PdfColor.fromHex('#2E3B4E'),
                              child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        _buildContactInfo(mat.Icons.email,
                                            'frank@novoresume.com'),
                                        _buildContactInfo(
                                            mat.Icons.email, '123 444 555'),
                                      ]),
                                  pw.Column(children: [
                                    _buildContactInfo(mat.Icons.location_on,
                                        'Montgomery, AL'),
                                    _buildContactInfo(mat.Icons.location_city,
                                        'ltinkedin.com/in/frank.g'),
                                  ])
                                ],
                              ),
                            ),
                            pw.SizedBox(height: 20),

                            // Experience
                            _buildSectionHeader(
                                'WORK EXPERIENCE', PdfColors.black),
                            pw.Bullet(
                              text:
                                  'Sales Associate at ShoPerfect Deluxe Mall\n'
                                  '11/2018 - Present | Montgomery, AL\n\n'
                                  'Achievements\n'
                                  '- Formulated seasonal sales promotions, resulting in 30% increase in-store sales\n'
                                  '- Achieved a more than 98% customer satisfaction rate\n'
                                  '- Collaborated with a team to devise sales solutions to exceed targets\n',
                              style: const pw.TextStyle(fontSize: 12),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Bullet(
                              text:
                                  'Retail Sales Associate at Storefront Sports Solutions\n'
                                  '01/2015 - 10/2018 | Auburn, AL\n\n'
                                  'Achievements\n'
                                  '- Implemented a customer loyalty program resulting in a 50% sales increase\n'
                                  '- Exceeded yearly sales targets by more than 10%\n',
                              style: const pw.TextStyle(fontSize: 12),
                            ),
                            pw.SizedBox(height: 20),

                            // Conferences and Courses
                            _buildSectionHeader(
                                'CONFERENCES & COURSES', PdfColors.black),
                            pw.Text(
                              'Sales Training for High Performing Team Specialization - Coursera.org\n'
                              'Practical Sales Management Training - ShoPerfect Deluxe Mall\n'
                              'Sales Training: Practical Sales Techniques - Udemy.com',
                              style: const pw.TextStyle(fontSize: 12),
                            ),
                          ],
                        )))
          ]),
        ];
      },
    ),
  );

  // Save the PDF
  return pdf.save();
}

// Helper method to create section headers
pw.Widget _buildSectionHeader(String text, PdfColor textColor) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 10),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: pw.FontWeight.bold,
      ),
    ),
  );
}

// Helper method to create contact info rows with icons
pw.Widget _buildContactInfo(mat.IconData icon, String text) {
  return pw.Row(
    children: [
      pw.Icon(pw.IconData(icon.codePoint), size: 14, color: PdfColors.white),
      pw.SizedBox(width: 5),
      pw.Text(text,
          style: const pw.TextStyle(fontSize: 10, color: PdfColors.white)),
      pw.SizedBox(width: 20),
    ],
  );
}

// Helper method to create skill boxes
pw.Widget _buildSkillBox(String skill) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 5),
    padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: pw.BoxDecoration(
      color: PdfColors.grey300,
      borderRadius: pw.BorderRadius.circular(5),
    ),
    child: pw.Text(skill,
        style: const pw.TextStyle(fontSize: 10, color: PdfColors.black)),
  );
}
