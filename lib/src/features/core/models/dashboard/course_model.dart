import 'package:flutter/material.dart';

class DashboardCoursesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCoursesModel(this.title,this.heading, this.subHeading, this.onPress);

  static List<DashboardCoursesModel> list = [
    DashboardCoursesModel("Flutter Crash Course", "3 Sections", "Programming Language", null),
    DashboardCoursesModel("HTML / CSS Crash Course", "2 Sections", "35 Lessons", null),
    DashboardCoursesModel("Matrial Design Course", "6 Sections", "Programming & Design", null),
  ];
}