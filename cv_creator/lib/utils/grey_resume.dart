import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart' as mat; // To use Material Icons

Future<Uint8List> generateGreyResumePdf() async {
  final pdf = pw.Document();

  // Load the profile image
  final profileImage = await rootBundle.load('assets/profile_image.jpeg');
  final Uint8List profileImageData = profileImage.buffer.asUint8List();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Left column with profile picture, contact, education, expertise
            pw.Container(
              width: 180,
              color: PdfColor.fromHex(
                  "#E9DFDC"), // Custom left section background color
              padding: const pw.EdgeInsets.all(10),
              child: pw.Column(
                children: [
                  // Profile Picture
                  pw.Container(
                    width: 100,
                    height: 100,
                    margin: const pw.EdgeInsets.only(top: 20, bottom: 20),
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

                  // Contact Information with Icons
                  _buildSectionHeader(
                      'Contact', PdfColors.white, PdfColors.blueGrey900),
                  _buildContactInfo(mat.Icons.phone, 'Phone: (123) 456-7890'),
                  _buildContactInfo(
                      mat.Icons.email, 'Email: jessica.smith@example.com'),
                  _buildContactInfo(
                      mat.Icons.web, 'Website: www.jessicasmith.com'),
                  // _buildContactInfo(mat.Icons.linkedin,
                  //     'LinkedIn: linkedin.com/in/jessicasmith'),
                  pw.SizedBox(height: 20),

                  // Education
                  _buildSectionHeader(
                      'Education', PdfColors.white, PdfColors.blueGrey900),
                  pw.Text(
                      'B.A. in Marketing, University of Example (2008 - 2012)',
                      style: const pw.TextStyle(color: PdfColors.white)),
                  pw.SizedBox(height: 20),

                  // Expertise
                  _buildSectionHeader(
                      'Expertise', PdfColors.white, PdfColors.blueGrey900),
                  pw.Text('Digital Marketing',
                      style: const pw.TextStyle(color: PdfColors.white)),
                  pw.Text('Brand Management',
                      style: const pw.TextStyle(color: PdfColors.white)),
                  pw.Text('SEO/SEM',
                      style: const pw.TextStyle(color: PdfColors.white)),
                  pw.Text('Customer Engagement',
                      style: const pw.TextStyle(color: PdfColors.white)),
                ],
              ),
            ),

            pw.SizedBox(width: 20),

            // Right column with name, profile, experience
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Name Section with Background Color
                  pw.Container(
                    width: double.infinity,
                    color: PdfColors
                        .grey800, // Background color for the name section
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Jessica Smith',
                          style: pw.TextStyle(
                            fontSize: 24,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                        pw.Text(
                          'Marketing Manager',
                          style: const pw.TextStyle(
                            fontSize: 18,
                            color: PdfColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // Professional Profile
                  _buildSectionHeader(
                      'Professional Profile', PdfColors.black, PdfColors.white),
                  pw.Text(
                    'Experienced marketing manager with a strong background in '
                    'planning and executing marketing strategies. Skilled in '
                    'digital marketing, branding, and customer engagement.',
                    textAlign: pw.TextAlign.justify,
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                  pw.SizedBox(height: 20),

                  // Experience
                  _buildSectionHeader(
                      'Experience', PdfColors.black, PdfColors.white),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Marketing Manager at XYZ Corp',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        ),
                      ),
                      pw.Text(
                        '2015 - Present',
                        style: const pw.TextStyle(
                            fontSize: 12, color: PdfColors.grey600),
                      ),
                      pw.Bullet(text: 'Lead marketing strategy for XYZ Corp.'),
                      pw.Bullet(
                          text:
                              'Managed a team of 10+ marketing professionals.'),
                      pw.Bullet(text: 'Increased brand visibility by 30%.'),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'Digital Marketing Specialist at ABC Ltd',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        ),
                      ),
                      pw.Text(
                        '2012 - 2015',
                        style: const pw.TextStyle(
                            fontSize: 12, color: PdfColors.grey600),
                      ),
                      pw.Bullet(text: 'Executed digital marketing campaigns.'),
                      pw.Bullet(text: 'Managed online advertising.'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // Save the PDF
  return pdf.save();
}

// Helper method to create section headers
pw.Widget _buildSectionHeader(
    String text, PdfColor textColor, PdfColor backgroundColor) {
  return pw.Container(
    alignment: pw.Alignment.centerLeft,
    margin: const pw.EdgeInsets.only(bottom: 10),
    padding: const pw.EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: pw.BoxDecoration(
      color: backgroundColor,
    ),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: pw.FontWeight.bold,
      ),
    ),
  );
}

// Helper method to create contact info with icons
pw.Widget _buildContactInfo(mat.IconData icon, String text) {
  return pw.Row(
    children: [
      pw.Container(
        margin: const pw.EdgeInsets.only(right: 10),
        child: pw.Icon(
          pw.IconData(icon.codePoint),
          size: 14,
          color: PdfColors.white,
        ),
      ),
      pw.Text(text, style: const pw.TextStyle(color: PdfColors.white)),
    ],
  );
}
