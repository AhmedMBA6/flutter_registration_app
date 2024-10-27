import 'package:flutter/material.dart';

class DashboardCategorieModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategorieModel(this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategorieModel> list = [
    DashboardCategorieModel("JS", "Java Script", "10 Lessons", null),
    DashboardCategorieModel("F", "Flutter", "12 Lessons", null),
    DashboardCategorieModel("H", "HTML", "5 Lessons", null),
    DashboardCategorieModel("K", "Kotlin", "8 Lessons", null),
    DashboardCategorieModel("P", "Python", "11 Lessons", null),
  ];
}
