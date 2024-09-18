import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> createPDF() async {
  final pdf = pw.Document();

  // Load custom font
  final fontData = await rootBundle.load("assets/fonts/Roboto-Regular.ttf");
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());

  final iconFont =
      await rootBundle.load("assets/fonts/MaterialIcons-Regular.ttf");
  final iconTtf = pw.Font.ttf(iconFont.buffer.asByteData());

  // Load the profile image
  final profileImage = await rootBundle.load('assets/profile_image1.jpg');
  final Uint8List profileImageData = profileImage.buffer.asUint8List();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Left column
            pw.Expanded(
              flex: 1,
              child: pw.Container(
                padding: pw.EdgeInsets.all(10),
                color: PdfColors.grey200,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Profile Image
                    pw.Container(
                      width: 80,
                      height: 80,
                      child: pw.Image(pw.MemoryImage(
                          profileImageData)), // Profile picture (replace 'imageData')
                    ),
                    pw.SizedBox(height: 10),

                    // Contact Information
                    pw.Text(
                      "Aarav Patel",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "Data Scientist",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 14,
                        color: PdfColors.orangeAccent,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    _contactInfo(iconTtf, ttf, "aarav@novoresume.com", 0xe0be),
                    _contactInfo(iconTtf, ttf, "123 444 555", 0xe0cd),
                    _contactInfo(iconTtf, ttf, "Palo Alto, CA", 0xe88a),
                    _contactInfo(
                        iconTtf, ttf, "linkedin.com/in/aarav.p", 0xe80b),

                    pw.SizedBox(height: 20),

                    // Technical Skills
                    pw.Text(
                      "Technical Skills",
                      style: pw.TextStyle(
                          font: ttf,
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Divider(),
                    _bulletList(ttf, [
                      "Python, SQL, JavaScript",
                      "Data Visualization, Machine Learning",
                      "Predictive Modeling, Deep Learning",
                      "Tableau, AWS Services",
                    ]),

                    pw.SizedBox(height: 20),

                    // Certificates
                    pw.Text(
                      "Certificates",
                      style: pw.TextStyle(
                          font: ttf,
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Divider(),
                    _bulletList(ttf, [
                      "Certification for Applied Data Analytics (2019)",
                      "Cloudera Data Science Essentials (2018)",
                      "High-Performance Computing with R (2018)",
                    ]),
                  ],
                ),
              ),
            ),

            pw.SizedBox(width: 20),

            // Right column
            pw.Expanded(
              flex: 2,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Work Experience
                  pw.Text(
                    "Work Experience",
                    style: pw.TextStyle(
                        font: ttf,
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Divider(),
                  _workExperienceEntry(
                    ttf,
                    "Data Scientist",
                    "Future Energy® Limited",
                    "06/2020 - Present",
                    [
                      "Develop action plans to mitigate risks in decision making.",
                      "Drive interaction and partnership between managers.",
                      "Build predictive models using machine learning tools.",
                      "Develop algorithms using NLP and Deep Learning.",
                    ],
                  ),
                  _workExperienceEntry(
                    ttf,
                    "Data Analyst",
                    "THETA Financial Group",
                    "03/2016 - 05/2020",
                    [
                      "Provided insights and proposals for business improvements.",
                      "Evaluated analytical model findings in the Global Monitoring Report.",
                    ],
                  ),
                  _workExperienceEntry(
                    ttf,
                    "Business Analyst / Statistician",
                    "Maxicare Healthcare",
                    "02/2014 - 02/2016",
                    [
                      "Developed Key Performance Indicators (KPI) and presented to management.",
                      "Analyzed KPI reports to monitor field service engineers.",
                    ],
                  ),

                  // Education Section
                  pw.SizedBox(height: 20),
                  pw.Text(
                    "Education",
                    style: pw.TextStyle(
                        font: ttf,
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Divider(),
                  pw.Text(
                    "Master of Science in Computer Science and Informatics",
                    style: pw.TextStyle(font: ttf, fontSize: 12),
                  ),
                  pw.Text(
                    "San Francisco University, 2014 - 2016",
                    style: pw.TextStyle(
                        font: ttf, fontSize: 12, color: PdfColors.grey600),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}

// Helper functions
pw.Widget _contactInfo(
    pw.Font iconTtf, pw.Font ttf, String text, int iconCode) {
  return pw.Row(
    children: [
      pw.Icon(pw.IconData(iconCode), font: iconTtf, size: 14),
      pw.SizedBox(width: 5),
      pw.Text(text, style: pw.TextStyle(font: ttf, fontSize: 12)),
    ],
  );
}

pw.Widget _bulletList(pw.Font ttf, List<String> items) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: items
        .map((item) =>
            pw.Bullet(text: item, style: pw.TextStyle(font: ttf, fontSize: 12)))
        .toList(),
  );
}

pw.Widget _workExperienceEntry(pw.Font ttf, String title, String company,
    String dates, List<String> bullets) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        "$title, $company",
        style: pw.TextStyle(
            font: ttf, fontSize: 14, fontWeight: pw.FontWeight.bold),
      ),
      pw.Text(
        dates,
        style: pw.TextStyle(font: ttf, fontSize: 12, color: PdfColors.grey600),
      ),
      pw.Bullet(text: bullets.join('\n')),
      pw.SizedBox(height: 10),
    ],
  );
}
