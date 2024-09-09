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
