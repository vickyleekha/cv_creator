import 'dart:io';
import 'package:cv_creator/app/data/model/employee_model.dart';
import 'package:cv_creator/pdf_preview_page.dart';
import 'package:cv_creator/utils/utility.dart';
import 'package:cv_creator/utils/utill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfile extends StatefulWidget {
  final List<ExperienceModel>? expList;
  const EditProfile({super.key, this.expList});

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

  var expList = [
    [
      '2019 - 2022',
      'Company Name l 123 Anywhere St., Any City',
      'Job position here',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pharetra in lorem at laoreet. Donec hendrerit libero eget est tempor, quis tempus arcu elementum. In elementum elit at dui tristique feugiat. Mauris convallis, mi at mattis malesuada, neque nulla volutpat dolor, hendrerit faucibus eros nibh ut nunc. Proin luctus urna id nunc sagittis dignissim. Sed in libero sed libero dictum dapibus. Vivamus fermentum est eget lorem aliquet, vel tempus metus dignissim. Donec risus arcu, tristique et sollicitudin blandit, iaculis ut nisl. Integer rutrum ultricies fringilla.'
    ],
    [
      '2019 - 2022',
      'Company Name l 123 Anywhere St., Any City',
      'Job position here',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pharetra in lorem at laoreet. Donec hendrerit libero eget est tempor, quis tempus arcu elementum. In elementum elit at dui tristique feugiat. Mauris convallis, mi at mattis malesuada, neque nulla volutpat dolor, hendrerit faucibus eros nibh ut nunc. Proin luctus urna id nunc sagittis dignissim. Sed in libero sed libero dictum dapibus. Vivamus fermentum est eget lorem aliquet, vel tempus metus dignissim. Donec risus arcu, tristique et sollicitudin blandit, iaculis ut nisl. Integer rutrum ultricies fringilla.'
    ],
    [
      '2019 - 2022',
      'Company Name l 123 Anywhere St., Any City',
      'Job position here',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pharetra in lorem at laoreet. Donec hendrerit libero eget est tempor, quis tempus arcu elementum. In elementum elit at dui tristique feugiat. Mauris convallis, mi at mattis malesuada, neque nulla volutpat dolor, hendrerit faucibus eros nibh ut nunc. Proin luctus urna id nunc sagittis dignissim. Sed in libero sed libero dictum dapibus. Vivamus fermentum est eget lorem aliquet, vel tempus metus dignissim. Donec risus arcu, tristique et sollicitudin blandit, iaculis ut nisl. Integer rutrum ultricies fringilla.'
    ]
  ];

  var expertise = ['Android', 'IOS', 'Flutter', 'dart'];

  var education = [
    ['2010', 'MCA', 'IGNOU'],
    ['2008', 'BCA', 'IGNOU']
  ];

  var language = ['English', 'Hindi', 'Punjabi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(right: 30, left: 30),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
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
                  width: 342,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your name', string: name.text),
                    controller: name,
                    keyboardType: TextInputType.name,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 190),
                  width: 342,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Email', string: email.text),
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 250),
                  width: 342,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Phone No.', string: name.text),
                    controller: phone,
                    keyboardType: TextInputType.phone,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 320),
                  width: 342,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Address', string: address.text),
                    controller: address,
                    keyboardType: TextInputType.streetAddress,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 390),
                  width: 342,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Position', string: post.text),
                    controller: post,
                    keyboardType: TextInputType.name,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 460),
                  width: 342,
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
              Container(
                margin: const EdgeInsets.only(top: 600),
                height: 30,
                width: 342,
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
                            expertise: expertise,
                            education: education,
                            language: language),
                      );
                    },
                    child: const Text("Save")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
