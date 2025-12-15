import 'package:flutter/material.dart';
import 'package:testing_w/console/page/dashboard/dashboard_main.dart';
import 'package:testing_w/console/page/orders/orders_page.dart';

class ContextArea extends StatefulWidget {
  final String selectPage;
  const ContextArea({super.key, required this.selectPage});

  @override
  State<ContextArea> createState() => _ContextAreaState();
}

class _ContextAreaState extends State<ContextArea> {
  @override
  Widget build(BuildContext context) {
    switch (widget.selectPage) {
      case "dashboard":
        return DashboardMain();
      case "order":
        return OrdersPage();
      case "analytics":
        return Center(child: Text('Analytics Page'));
      case "customer":
        return Center(child: Text('Customers Page'));
      case "menu":
        return Center(child: Text('Menu Page'));
      default:
        return Center(child: Text('Page not found'));
    }
  }
}
