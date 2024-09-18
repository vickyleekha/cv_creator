import 'package:cv_creator/utils/custom_widget.dart';
import 'package:flutter/material.dart';

class GridViewM extends StatefulWidget {
  const GridViewM({super.key});

  @override
  State<GridViewM> createState() => _GridViewMState();
}

class _GridViewMState extends State<GridViewM> {
  List<String> res = [
    'assets/resume/download.jpg',
    'assets/resume/skill-based-resume-template.png',
    'assets/resume/small.png',
    'assets/resume/grey.jpg',
    'assets/resume/res.png',
    'assets/resume/red_resume.jpg',
    'assets/resume/res_green.jpg',
    'assets/resume/pat.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Template View'),
        ),
        body: gridViewImages(res));
  }
}
