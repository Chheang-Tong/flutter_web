import 'package:flutter/material.dart';
import 'package:testing_w/console/desktop_console.dart';
import 'package:testing_w/console/mobile_console.dart';
import 'package:testing_w/console/tablet_console.dart';
import 'package:testing_w/core/res/responsive.dart';

class ConsolePage extends StatelessWidget {
  final String? section;
  const ConsolePage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileConsole(),
      tablet: TabletConsole(),
      desktop: DesktopConsole(),
    );
  }
}
