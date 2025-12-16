import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_w/change/colors.dart';
import 'package:testing_w/console/widget/_mobile_drawer.dart';
import 'package:testing_w/console/widget/context_area.dart';
import 'package:testing_w/console/widget/_navbar_tablet.dart';
import 'package:testing_w/core/providers/drawer_provider.dart';
import 'package:testing_w/feature/page/string_page.dart';

class TabletConsole extends StatefulWidget {
  const TabletConsole({super.key});

  @override
  State<TabletConsole> createState() => _TabletConsoleState();
}

class _TabletConsoleState extends State<TabletConsole> {
  String selectedPage = StringPage.dashboard;
  void _onSelectPage(String page) {
    setState(() {
      selectedPage = page;
    });
  }
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String section =
        GoRouter.of(
          context,
        ).routerDelegate.currentConfiguration.pathParameters['section'] ??
        selectedPage;
    setState(() {
      selectedPage = section;
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
