import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_w/change/colors.dart';
import 'package:testing_w/console/widget/_mobile_drawer.dart';
import 'package:testing_w/console/widget/_navbar_tablet.dart';
import 'package:testing_w/console/widget/context_area.dart';
import 'package:testing_w/core/providers/drawer_provider.dart';

class MobileConsole extends StatefulWidget {
  const MobileConsole({super.key});

  @override
  State<MobileConsole> createState() => _MobileConsoleState();
}

class _MobileConsoleState extends State<MobileConsole> {
  String selectedPage = 'dashboard';
  void _onSelectPage(String page) {
    setState(() {
      selectedPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final drawProvider = Provider.of<DrawerProvider>(context);
    return Scaffold(
      key: drawProvider.scafoldKey,
      backgroundColor: bgColor,
      drawer: MobileDrawer(selectedPage: _onSelectPage),
      body: Column(
        children: [
          NavbarTablet(),
          Expanded(child: ContextArea(selectPage: selectedPage)),
        ],
      ),
    );
  }
}
