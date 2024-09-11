import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flutter/material.dart' as m;

line() => Container(
      height: 1,
      width: 200,
      decoration: const BoxDecoration(color: PdfColors.white),
    );

bigLine() => Container(
    height: 1,
    width: 500,
    margin: const EdgeInsets.only(top: 5, bottom: 5),
    decoration: BoxDecoration(color: PdfColor.fromHex("#30394A")));

greyTextStyle14() => TextStyle(
    color: PdfColor.fromHex("#737373"),
    fontWeight: FontWeight.bold,
    fontSize: 14);

blueTextStyle16() => TextStyle(
    color: PdfColor.fromHex("#30394A"),
    fontWeight: FontWeight.bold,
    fontSize: 16);

blueTextStyle20() => TextStyle(
    color: PdfColor.fromHex("#30394A"),
    fontWeight: FontWeight.bold,
    fontSize: 20);

blueTextStyle(fontSize) => TextStyle(
    color: PdfColor.fromHex("#30394A"),
    fontWeight: FontWeight.bold,
    fontSize: fontSize);

whiteTextStyle16() => const TextStyle(color: PdfColors.white, fontSize: 20);

whiteTextStyle20() => TextStyle(
    fontWeight: FontWeight.bold, color: PdfColors.white, fontSize: 20);

circle4() => Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: PdfColors.white),
    );

langContainer(language) => Container(
    margin: const EdgeInsets.only(
      top: 20,
    ),
    child: ListView.builder(
        itemBuilder: (context, i) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(language[i],
                    style:
                        const TextStyle(color: PdfColors.white, fontSize: 14))
              ]);
        },
        itemCount: language.length));

expContainer(expList) => Container(
    margin: const EdgeInsets.only(top: 10),
    child: ListView.builder(
        direction: Axis.vertical,
        itemBuilder: (context, i) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expList[i].year!, style: blueTextStyle16()),
                Text(expList[i].companyName!, style: greyTextStyle14()),
                Text(expList[i].jobPosition!, style: blueTextStyle16()),
                Text(expList[i].experienceDetails!, style: greyTextStyle14())
              ]);
        },
        itemCount: expList.length));

expertiseContainer(expertise) => Container(
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
                  Text(expertise[i], style: whiteTextStyle16())
                ])
              ]);
        },
        itemCount: expertise.length));

imageContainer(image) => Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
        ),
        shape: BoxShape.circle,
      ),
    );

educationContainer(education) => Container(
    margin: const EdgeInsets.only(top: 20),
    child: ListView.builder(
        itemCount: education.length,
        itemBuilder: (context, i) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(education[i][0],
                    style:
                        const TextStyle(color: PdfColors.white, fontSize: 14)),
                Text(education[i][1], style: whiteTextStyle20()),
                Text(education[i][2],
                    style:
                        const TextStyle(color: PdfColors.white, fontSize: 16))
              ]);
        }));

MultiLineText({
  text,
  textStyle,
  lineColors,
}) {
  List<String> getLines(String text, TextStyle style, double maxWidth) {
    final textPainter = m.TextPainter(
      text: m.TextSpan(text: text, style: m.TextStyle()),
      textDirection: m.TextDirection.ltr,
      maxLines: null, // Allow unlimited lines
    );

    // Perform layout with the given constraints
    textPainter.layout(maxWidth: maxWidth);

    // Get line metrics to determine line boundaries
    List<String> lines = [];
    final lineMetrics = textPainter.computeLineMetrics();
    int startOffset = 0;

    for (var i = 0; i < lineMetrics.length; i++) {
      final lineMetric = lineMetrics[i];
      final endOffset = textPainter
          .getPositionForOffset(m.Offset(maxWidth, lineMetric.baseline))
          .offset;

      // Extract the text for the current line
      final lineText = text.substring(startOffset, endOffset).trim();
      lines.add(lineText);

      startOffset = endOffset;
      if (startOffset >= text.length) {
        break;
      }
    }

    return lines;
  }

  return LayoutBuilder(
    builder: (context, constraints) {
      double maxWidth = 342;

      print(maxWidth);

      // Get the lines of text using the _getLines function
      List<String> lines = getLines(text, textStyle, maxWidth);

      // Create a Text widget for each line with a different color
      return Wrap(
        direction: Axis.vertical,
        children: List.generate(lines.length, (index) {
          return Container(
            color: lineColors[
                index % lineColors.length], // Background color for each line
            child: Text(
              lines[index],
              style: textStyle.copyWith(
                color: PdfColors.white, // Text color, change as needed
              ),
            ),
          );
        }),
      );
    },
  );
}
