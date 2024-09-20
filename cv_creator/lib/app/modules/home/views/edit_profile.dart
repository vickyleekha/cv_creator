import 'dart:io';
import 'package:cv_creator/app/data/model/education_model.dart';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/app/modules/home/views/grid_view.dart';
import 'package:cv_creator/utils/utility.dart';
import 'package:cv_creator/utils/utill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  final List<ExperienceModel>? expList;
  final List<EducationModel>? eduList;
  const EditProfile({super.key, this.expList, this.eduList});

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
                    " Experience",
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
              GestureDetector(
                onTap: () {
                  Get.toNamed('/education');
                  // sh
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 100, top: 50),
                  child: const Text(
                    "Education",
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
                    onPressed: () async {
                      // Obtain shared preferences.
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

// Save an String value to 'name' key.
                      await prefs.setString('name', name.text);
                      await prefs.setString('email', email.text);
                      await prefs.setString('phone', phone.text);
                      await prefs.setString('address', address.text);
                      await prefs.setString('intro', intro.text);
                      await prefs.setString('post', post.text);
                      await prefs.setString('path', paths.toString());

                      Get.to(GridViewM(
                        expList: widget.expList,
                        eduList: widget.eduList,
                      ));
                    },
                    child: const Text("Save")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
