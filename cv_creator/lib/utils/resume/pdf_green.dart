import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generateGreenResumePdf() async {
  final pdf = pw.Document();

  final profileImage = await rootBundle.load(
      'assets/profile_image.jpg'); // Make sure to add your profile image in assets
  final Uint8List profileImageData = profileImage.buffer.asUint8List();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section with Name and Title
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Elijah',
                        style: pw.TextStyle(
                          fontSize: 36,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        'Williams',
                        style: pw.TextStyle(
                          fontSize: 36,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.green,
                        ),
                      ),
                    ],
                  ),
                  pw.Container(
                    width: 80,
                    height: 80,
                    decoration: const pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      color: PdfColors.green200,
                    ),
                    child: pw.ClipOval(
                      child: pw.Image(pw.MemoryImage(profileImageData)),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Work Experience Section
              pw.Text(
                'WORK EXPERIENCE',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.green,
                ),
              ),
              pw.SizedBox(height: 10),

              // First Job Experience
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Account Sales Executive',
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'Saas Company, LLC | Jan 2020 - Aug 2022',
                    style:
                        const pw.TextStyle(fontSize: 12, color: PdfColors.grey),
                  ),
                  pw.Bullet(
                      text:
                          'Boosted sales activities by 30% in the west coast region.'),
                  pw.Bullet(
                      text: 'Maintained a 100% client satisfaction rating.'),
                  pw.Bullet(
                      text:
                          'Opened five new accounts by providing consistent service.'),
                ],
              ),
              pw.SizedBox(height: 10),

              // Second Job Experience
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Field Sales Manager',
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'Content Company, Inc. | Jan 2018 - Jan 2020',
                    style:
                        const pw.TextStyle(fontSize: 12, color: PdfColors.grey),
                  ),
                  pw.Bullet(
                      text:
                          'Increased customer loyalty by 40% within six months.'),
                  pw.Bullet(
                      text: 'Achieved a 10% growth rate in our client base.'),
                  pw.Bullet(text: 'Boosted customer satisfaction by 33%.'),
                ],
              ),
              pw.SizedBox(height: 10),

              // Third Job Experience
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Sales Intern',
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'Technology Company, Inc. | Jan 2020 - Aug 2022',
                    style:
                        const pw.TextStyle(fontSize: 12, color: PdfColors.grey),
                  ),
                  pw.Bullet(
                      text:
                          'Boosted sales activities by 30% in the west coast region.'),
                  pw.Bullet(
                      text: 'Maintained a 100% client satisfaction rating.'),
                  pw.Bullet(
                      text:
                          'Opened five new accounts by providing consistent service.'),
                ],
              ),
              pw.SizedBox(height: 20),

              // Right Column: Contact Info, Skills, and Education
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Skills Section
                  pw.Expanded(
                    flex: 2,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'RELEVANT SKILLS',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.green,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Bullet(text: 'Account Management'),
                        pw.Bullet(
                            text: 'Customer Relationship Management Software'),
                        pw.Bullet(text: 'Strategic and Social Selling'),
                        pw.Bullet(text: 'Team Leadership'),
                        pw.Bullet(text: 'Adobe Photoshop'),
                        pw.Bullet(text: 'Salesforce'),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 20),

                  // Contact Info and Education Section
                  pw.Expanded(
                    flex: 1,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'SALES EXECUTIVE',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.green,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text('LinkedIn: linkedin.com/in/name'),
                        pw.Text('Email: hello@yourgreatsite.com'),
                        pw.Text('Phone: 123-456-7890'),
                        pw.SizedBox(height: 20),

                        // Education History
                        pw.Text(
                          'EDUCATION HISTORY',
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.green,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'Bachelor of Science in Business Administration, Major in Supply Chain Management\nHarvard University | May 2020',
                          style: const pw.TextStyle(fontSize: 12),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'Associate\'s Degree in Sales and Marketing\nNorth Shore Community College | May 2018',
                          style: const pw.TextStyle(fontSize: 12),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          '4.0 GPA\nNorth Centennial Private | May 2016',
                          style: const pw.TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );

  return pdf.save();
}
