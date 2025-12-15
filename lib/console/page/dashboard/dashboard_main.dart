import 'package:flutter/material.dart';
import 'package:testing_w/console/page/dashboard/dashboard_desktop.dart';
import 'package:testing_w/console/page/dashboard/dashboard_mobile.dart';
import 'package:testing_w/console/page/dashboard/dashboard_tablet.dart';
import 'package:testing_w/core/res/responsive.dart';

class DashboardMain extends StatelessWidget {
  const DashboardMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: DashboardPageMobile(),
      tablet: DashboardPageTablet(),
      desktop: DashboardPageDesktop(),
    );
  }
}
