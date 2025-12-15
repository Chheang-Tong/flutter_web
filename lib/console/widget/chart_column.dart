// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:testing_w/feature/model/chart_column_data.dart';

class ChartColumn extends StatelessWidget {
  const ChartColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBackgroundColor: Colors.transparent,
      margin: EdgeInsets.all(0),
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        plotOffset: 20,
        axisLine: const AxisLine(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
        maximum: 50000,
        minimum: 5000,
        interval: 5000,
      ),
      series: <CartesianSeries>[
        ColumnSeries<ChartColumnData, String>(
          borderRadius: BorderRadius.circular(6),
          dataSource: chartData,
          width: 0.6,
          xValueMapper: (ChartColumnData data, _) => data.month,
          yValueMapper: (ChartColumnData data, _) => data.amount,
          // pointColorMapper: (d, _) => d.color, 
          onCreateRenderer: (series) => _CustomColumnSeriesRenderer(),
        ),
      ],
    );
  }
}

// class _CustomColumnSeriesRenderer
//     extends ColumnSeriesRenderer<ChartColumnData, String> {
//   _CustomColumnSeriesRenderer();

//   @override
//   ColumnSegment<ChartColumnData, String> createSegment() {
//     // Return our custom segment painter
//     return _CustomColumnSeriesPainter();
//   }
// }

// // Custom painter for each column segment
// class _CustomColumnSeriesPainter
//     extends ColumnSegment<ChartColumnData, String> {
//   late Rect _rect;

//   @override
//   void onPaint(Canvas canvas) {
//     if (segmentRect == null) {
//       return;
//     }

//     // Get the raw rect of this column
//     _rect = segmentRect!.outerRect;

//     // Example: make the top corners more rounded
//     segmentRect = RRect.fromRectAndCorners(
//       _rect,
//       topLeft: const Radius.circular(8),
//       topRight: const Radius.circular(8),
//     );

//     // Use the base painting logic (fills, borders, etc.)
//     super.onPaint(canvas);
//   }
// }

class _CustomColumnSeriesRenderer
    extends ColumnSeriesRenderer<ChartColumnData, String> {
  @override
  ColumnSegment<ChartColumnData, String> createSegment() {
    return _CustomColumnSegment();
  }
}

class _CustomColumnSegment extends ColumnSegment<ChartColumnData, String> {
  @override
  void onPaint(Canvas canvas) {
    if (segmentRect == null || currentSegmentIndex == null) return;

    final Rect rect = segmentRect!.outerRect;

    final ChartColumnData dataPoint = chartData[currentSegmentIndex];

    // 3) Use that color (with a simple vertical gradient)
    final Color barColor = dataPoint.color;
    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [barColor.withOpacity(0.9), barColor.withOpacity(0.5)],
      ).createShader(rect);

    final RRect rRect = RRect.fromRectAndCorners(
      rect,
      topLeft: const Radius.circular(8),
      topRight: const Radius.circular(8),
    );

    canvas.drawRRect(rRect, paint);
  }
}
