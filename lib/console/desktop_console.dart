import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_w/change/colors.dart';
import 'package:testing_w/console/widget/context_area.dart';
import 'package:testing_w/console/widget/_navbar_desktop.dart';
import 'package:testing_w/console/widget/sidebar.dart';
import 'package:testing_w/feature/page/string_page.dart';

class DesktopConsole extends StatefulWidget {
  const DesktopConsole({super.key});

  @override
  State<DesktopConsole> createState() => _DesktopConsoleState();
}

class _DesktopConsoleState extends State<DesktopConsole> {
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
    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
          Sidebar(onSelectPage: _onSelectPage, selectedPage: selectedPage),
          Expanded(
            child: Column(
              children: [
                NavbarDesktop(),
                Expanded(child: ContextArea(selectPage: selectedPage)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
