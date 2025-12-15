// lib/feature/model/chart_column_data.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ChartColumnData {
  ChartColumnData({
    required this.month,
    required this.amount,
    required this.color,
  });

  final String month;
  final double amount;
  final Color color;
}

// very light gray for normal bars
final _baseColor = Colors.grey.withOpacity(0.2);

// highlight colors
final _green = const Color(0xFF4CAF50);
final _purple = const Color(0xFF7C4DFF);
final _pink = const Color(0xFFE91E63);

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData(month: 'Jan', amount: 8000, color: _baseColor),
  ChartColumnData(month: 'Feb', amount: 20000, color: _baseColor),
  ChartColumnData(month: 'Mar', amount: 16000, color: _green), // green
  ChartColumnData(month: 'Apr', amount: 14000, color: _baseColor),
  ChartColumnData(month: 'May', amount: 15000, color: _baseColor),
  ChartColumnData(month: 'Jun', amount: 40000, color: _purple), // purple
  ChartColumnData(month: 'Jul', amount: 12000, color: _baseColor),
  ChartColumnData(month: 'Aug', amount: 9000, color: _baseColor),
  ChartColumnData(month: 'Sep', amount: 7000, color: _baseColor),
  ChartColumnData(month: 'Oct', amount: 22000, color: _pink), // pink
  ChartColumnData(month: 'Nov', amount: 13000, color: _baseColor),
  ChartColumnData(month: 'Dec', amount: 17000, color: _baseColor),
];

class LegendItem {
  final Color color;
  final String title;
  LegendItem({required this.color, required this.title});
}

final List<LegendItem> legendItemsColumn = [
  LegendItem(color: _green, title: 'Pending (10%)'),
  LegendItem(color: _purple, title: 'Income'),
  LegendItem(color: _pink, title: 'Expance'),
];

final List<LegendItem> legendItemsRadial = [
  LegendItem(color: Color(0xFF8A8BFC), title: 'Current Customers'),
  LegendItem(color: Color(0xFFABD35A), title: 'New Customers'),
];
