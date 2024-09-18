import 'package:flutter/material.dart';


gridViewImages(List<String> imageList) => GridView.builder(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1),
    itemCount: imageList.length,
    itemBuilder: (BuildContext ctx, index) {
      return Stack(children: [
        GestureDetector(
            onTap: () {
           Get.to(Scaffold(
                          appBar: AppBar(
                            title: const Text('PDF Preview'),
                          ),
                          body: PdfPreview(
                              onError: (cont, error) {
                                return Text(error.toString());
                              },
                              pdfFileName: "name.pdf",
                              canChangeOrientation: false,
                              canDebug: false,
                              canChangePageFormat: false,
                              // pdfPreviewPageDecoration: BoxDecoration(
                              //   color: Colors.red[100],
                              // ),
                              actionBarTheme: const PdfActionBarTheme(
                                  backgroundColor:
                                      Color.fromRGBO(244, 67, 54, 1)),
                              build: (context) =>
                                  
                                  generateSkillBasedResumePdf()))); // Call the method to generate the PDF
                   
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(imageList[index])),
                  ),
                )))
      ]);
    });
