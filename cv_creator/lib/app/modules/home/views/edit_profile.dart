import 'dart:io';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/app/modules/home/views/pdf_preview_page.dart';
import 'package:cv_creator/utils/grey_resume.dart';
import 'package:cv_creator/utils/new_pdf.dart';
import 'package:cv_creator/utils/pdf_green.dart';
import 'package:cv_creator/utils/red_heading.dart';
import 'package:cv_creator/utils/simple_resume.dart';
import 'package:cv_creator/utils/skill_based.dart';
import 'package:cv_creator/utils/utility.dart';
import 'package:cv_creator/utils/utill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

class EditProfile extends StatefulWidget {
  final List<ExperienceModel>? expList;
  final List<String>? comList;
  const EditProfile({super.key, this.expList, this.comList});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController post = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController intro = TextEditingController();

  bool permissionGranted = true;

  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  String? paths;
  openImage() async {
    if (permissionGranted) {
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // getting a directory path for saving
        Directory directory = Directory("/storage/emulated/0/Download/Epvi");
        directory.create(recursive: false);

        if (directory.path.isNotEmpty) {
          // Step 3: Get directory where we can duplicate selected file.
          final String duplicateFilePath = directory.path;

          var path = '$duplicateFilePath/${generateRandomStringId(10)}.png';
          // Step 4:save the file to a application  directory.
          pickedFile.saveTo(path);
          paths = path;
        }
      }
    } else {
      _getStoragePermission();
    }
  }

  @override
  void initState() {
    if (permissionGranted == false) {
      _getStoragePermission();
    }
    super.initState();
  }

  var education = [
    ['2010', 'MCA', 'IGNOU'],
    ['2008', 'BCA', 'IGNOU'],
    ['2010', 'MCA', 'IGNOU'],
    ['2008', 'BCA', 'IGNOU']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(right: 30, left: 30),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 90),
                child: IconButton(
                    onPressed: () => openImage(),
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 24,
                      color: Colors.red,
                    )),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 130),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your name', string: name.text),
                    controller: name,
                    keyboardType: TextInputType.name,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 190),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Email', string: email.text),
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 250),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Phone No.', string: name.text),
                    controller: phone,
                    keyboardType: TextInputType.phone,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 320),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Address', string: address.text),
                    controller: address,
                    keyboardType: TextInputType.streetAddress,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 390),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Position', string: post.text),
                    controller: post,
                    keyboardType: TextInputType.name,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 460),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: decoration(
                        hintText: 'Enter your Intro', string: intro.text),
                    controller: intro,
                    keyboardType: TextInputType.multiline,
                  )),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/home');
                  // sh
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    " Add Exp",
                    style: TextStyle(
                      // fontFamily: AppTheme.fontName,
                      color: Color.fromRGBO(103, 167, 237, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/common', arguments: "Expertise");
                  // sh
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 100, top: 20),
                  child: const Text(
                    "Expertise",
                    style: TextStyle(
                      // fontFamily: AppTheme.fontName,
                      color: Color.fromRGBO(103, 167, 237, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/common', arguments: "Language");
                  // sh
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 50),
                  child: const Text(
                    "Language",
                    style: TextStyle(
                      // fontFamily: AppTheme.fontName,
                      color: Color.fromRGBO(103, 167, 237, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 570),
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        PdfPreviewPage(
                            name: name.text,
                            email: email.text,
                            phone: phone.text,
                            address: address.text,
                            intro: intro.text,
                            post: post.text,
                            path: paths!,
                            expList: widget.expList!,
                            expertise: widget.comList!,
                            education: education,
                            language: widget.comList!),
                      );
                    },
                    child: const Text("Save")),
              ),
              Container(
                margin: const EdgeInsets.only(top: 630),
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
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
                                  // generateCV()
                                  generateSkillBasedResumePdf()))); // Call the method to generate the PDF
                    },
                    child: const Text("new resume")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
