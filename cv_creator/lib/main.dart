import 'package:cv_creator/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

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
    return GetMaterialApp(
      title: 'CV Creator App',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}





     //   AlertDialog alert = AlertDialog(
                  //     shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(11))),
                  //     content: Container(
                  //       padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //       height: 300,
                  //       width: MediaQuery.of(context).size.width * 0.85,

                  //       // margin: const EdgeInsets.only(top: 520),
                  //       child: const Chip(
                  //           backgroundColor: Colors.amber, label: Text("item")),
                  //     ),
                  //     insetPadding: EdgeInsets.zero,
                  //     contentPadding: EdgeInsets.zero,
                  //     clipBehavior: Clip.antiAliasWithSaveLayer,
                  //   );

                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return alert;
                  //     },
                  //   );