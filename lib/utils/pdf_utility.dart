import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

line() => Container(
      height: 1,
      width: 200,
      decoration: const BoxDecoration(color: PdfColors.white),
    );

bigLine() => Container(
    height: 1,
    width: 500,
    margin: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
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

whiteTextStyle16() => const TextStyle(color: PdfColors.white, fontSize: 20);

whiteTextStyle20() => TextStyle(
    fontWeight: FontWeight.bold, color: PdfColors.white, fontSize: 20);

circle4() => Container(
      height: 4,
      width: 4,
      margin: const EdgeInsets.only(right: 5),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: PdfColors.white),
    );
