import 'package:cv_creator/pdf_preview_page.dart';
import 'package:cv_creator/utils/utill_widget.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'utility.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Creator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const EditProfile(),
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController post = TextEditingController();
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

  openImage(context) async {
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfPreviewPage(
                    name: "Vicky",
                    path: path,
                    expList: expList,
                    expertise: expertise,
                    education: education,
                    language: language),
              ));

          // setState(() {

          // });
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
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                    onPressed: () => openImage(context),
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 24,
                      color: Colors.red,
                    )),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  width: 342,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your name', string: name.text),
                    controller: name,
                    keyboardType: TextInputType.name,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 120),
                  width: 342,
                  child: TextFormField(
                    decoration: decoration(
                        hintText: 'Enter your Position', string: post.text),
                    controller: post,
                    keyboardType: TextInputType.name,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 180),
                  width: 342,
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: decoration(
                        hintText: 'Enter your Intro', string: intro.text),
                    controller: intro,
                    keyboardType: TextInputType.multiline,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
