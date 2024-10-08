import 'package:cv_creator/app/data/model/education_model.dart';
import 'package:cv_creator/app/data/model/experience_model.dart';
import 'package:cv_creator/utils/custom_widget.dart';
import 'package:flutter/material.dart';

class GridViewM extends StatefulWidget {
  final List<ExperienceModel>? expList;
  final List<EducationModel>? eduList;
  const GridViewM({super.key, this.expList, this.eduList});

  @override
  State<GridViewM> createState() => _GridViewMState();
}

class _GridViewMState extends State<GridViewM> {
  List<String> res = [
    'assets/resume/res.png',
    'assets/resume/download.jpg',
    'assets/resume/skill-based-resume-template.png',
    'assets/resume/small.png',
    'assets/resume/grey.jpg',
    'assets/resume/red_resume.jpg',
    'assets/resume/tech-resume-template.png',
    'assets/resume/res_green.jpg',
    'assets/resume/pat.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Template View'),
        ),
        body: gridViewImages(res, widget.eduList, widget.expList));
  }
}
