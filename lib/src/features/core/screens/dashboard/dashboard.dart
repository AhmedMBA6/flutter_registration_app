import 'package:flutter/material.dart';
import 'package:flutter_registration_app/src/constants/sizes.dart';
import 'package:flutter_registration_app/src/constants/text_strings.dart';
import 'package:flutter_registration_app/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:flutter_registration_app/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:flutter_registration_app/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:flutter_registration_app/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:flutter_registration_app/src/features/core/screens/dashboard/widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //variables
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: DashboardAppBar(txtTheme: txtTheme),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(dashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              Text(
                tDashboardTitle,
                style: txtTheme.bodyMedium,
              ),
              Text(
                tDashboardHeading,
                style: txtTheme.headlineMedium,
              ),
              SizedBox(
                height: dashboardPadding,
              ),
              //search box
              DashboardSearchBox(txtTheme: txtTheme),
              SizedBox(
                height: dashboardPadding,
              ),

              //Categories
              DashboardCategories(txtTheme: txtTheme),
              SizedBox(
                height: dashboardPadding,
              ),
              //Banners
              DashboardBanners(txtTheme: txtTheme),
              SizedBox(
                height: dashboardCardPadding,
              ),
              //Top Courses
              Text(
                tDashboardTopCourses,
                style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2),
              ),
              DashboardTopCourses(txtTheme: txtTheme)
            ],
          ),
        ),
      ),
    );
  }
}





