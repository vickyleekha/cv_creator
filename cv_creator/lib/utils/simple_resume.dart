import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generateResumePdf() async {
  final pdf = pw.Document();

  final profileImage = await rootBundle
      .load('assets/profile_image.jpeg'); // Add a profile image in assets
  final Uint8List profileImageData = profileImage.buffer.asUint8List();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Ella Elmer',
                          style: pw.TextStyle(
                              fontSize: 24, fontWeight: pw.FontWeight.bold)),
                      pw.Text('Nationality: American'),
                      pw.Text('Address: 10400 Fairway, 95043 Cupertino, USA'),
                      pw.Text('Phone number: 781-292-xxxx'),
                      pw.Text('Email address: hello@cickresume.com'),
                      pw.Text('Web: www.cickresume.com'),
                    ],
                  ),
                  pw.Image(
                    pw.MemoryImage(profileImageData),
                    width: 60,
                    height: 60,
                    fit: pw.BoxFit.cover,
                  ),
                ],
              ),

              pw.SizedBox(height: 20),

              // Resume Summary
              pw.Text('Resume Summary',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text(
                'Detail-oriented and motivated Software Architect with almost 4 years of extensive industry experience '
                'and a well-developed field expertise. An effective team player and leader possessing exceptional '
                'communication and organizational skills and the important ability to operate in fast-paced environments.',
                textAlign: pw.TextAlign.justify,
              ),

              pw.SizedBox(height: 20),

              // Work Experience
              pw.Text('Work Experience',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Software Architect',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.Text(
                  'Hesty Technologies, Inc. | 06/2015 - present, Miami, FL, United States'),
              pw.SizedBox(height: 5),
              pw.Bullet(
                  text:
                      'Investigated and solved any technical problems and participated in software development projects.'),
              pw.Bullet(
                  text:
                      'Managed the development of multiple software applications.'),
              pw.Bullet(
                  text:
                      'Designed innovative solutions to increase productivity.'),

              // Education
              pw.SizedBox(height: 20),
              pw.Text('Education',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text('Computer Science',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.Text(
                  'University of Toronto, Toronto, ON, Canada | 09/2006 - 05/2010'),
              pw.Text('Grade: 5388 / Graduated with Distinction.'),

              // Skills
              pw.SizedBox(height: 20),
              pw.Text('Skills',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Row(
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('SOFTWARE'),
                      pw.Text('Microsoft Office Suite'),
                      pw.Text('Adobe Photoshop'),
                    ],
                  ),
                  pw.SizedBox(width: 100),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('PROGRAMMING'),
                      pw.Text('C++'),
                      pw.Text('JavaScript'),
                    ],
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
