import 'dart:typed_data';
import 'package:cv_creator/utils/pdf_utility.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generateRedResumePdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section with Red Background
              pw.Container(
                color: PdfColors.red,
                padding: const pw.EdgeInsets.all(16),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'GUY FLETCHER',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      'HR CONSULTANT',
                      style: const pw.TextStyle(
                        fontSize: 14,
                        color: PdfColors.white,
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      '+(0) 1 2345 555 | 1973 Thrash Trail, Shreveport, LA 71106 | name@email.com',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),

              // Summary Section
              pw.Text(
                'Vivamus congue magna at luctus dapibus. Suspendisse sit amet mi sed velit ornare finibus vitae sed orci.',
                textAlign: pw.TextAlign.justify,
              ),
              pw.SizedBox(height: 20),

              // Work History Section
              pw.Text(
                'WORK HISTORY',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.red,
                ),
              ),
              fullLine(
                PdfColors.red,
              ),
              pw.SizedBox(height: 10),

              // First Job Experience
              pw.Text(
                'Your Role at Company (2018 - Present)',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Bullet(
                text:
                    'Handled various HR functions and collaborated with senior management.',
              ),
              pw.Bullet(
                text:
                    'Worked on employee development and designed training programs.',
              ),
              pw.Bullet(
                text:
                    'Led a team of HR professionals to handle employee relations.',
              ),
              pw.SizedBox(height: 10),

              // Second Job Experience
              pw.Text(
                'Your Role at Company (2016 - 2018)',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Bullet(
                text:
                    'Assisted in employee onboarding and managing performance appraisals.',
              ),
              pw.Bullet(
                text:
                    'Ensured compliance with labor laws and company policies.',
              ),
              pw.Bullet(
                text:
                    'Coordinated with department heads for resource planning.',
              ),
              pw.SizedBox(height: 20),

              // Skills Section
              pw.Text(
                'SKILLS',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.red,
                ),
              ),

              fullLine(
                PdfColors.red,
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 5,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Bullet(text: 'Leadership & Management'),
                          pw.Bullet(text: 'Employee Relations'),
                          pw.Bullet(text: 'Performance Appraisals'),
                          pw.Bullet(text: 'Conflict Resolution'),
                        ],
                      ),
                    ),
                    pw.Expanded(
                      flex: 5,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Bullet(text: 'Leadership & Management'),
                          pw.Bullet(text: 'Employee Relations'),
                          pw.Bullet(text: 'Performance Appraisals'),
                          pw.Bullet(text: 'Conflict Resolution'),
                        ],
                      ),
                    ),
                  ]),

              pw.SizedBox(height: 20),

              // Education Section
              pw.Text(
                'EDUCATION',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.red,
                ),
              ),
              fullLine(
                PdfColors.red,
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'High School Name (2010 - 2012)',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                textAlign: pw.TextAlign.justify,
              ),
              pw.SizedBox(height: 10),

              pw.Text(
                'School Name (2006 - 2010)',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                textAlign: pw.TextAlign.justify,
              ),
            ],
          ),
        );
      },
    ),
  );

  return pdf.save();
}
