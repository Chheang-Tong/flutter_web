// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChartRadial extends StatefulWidget {
  const ChartRadial({super.key});

  @override
  State<ChartRadial> createState() => _ChartRadialState();
}

class _ChartRadialState extends State<ChartRadial> {
  List<Color> colorsBlue = [
    const Color(0xFFc1a0f8).withOpacity(1.0),
    const Color(0xFFaa97f9).withOpacity(1.0),
    const Color(0xFF8689fc).withOpacity(1.0),
    const Color(0xFF617bfd).withOpacity(1.0),
  ];
  List<Color> colorsGreen = [
    const Color(0xFF90f2d7),
    const Color(0xFF5ef0c9),
    const Color(0xFF2deebc),
    const Color(0xFF00e9ad),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xFFe4e5ee)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFe4e5ee),
            spreadRadius: 4,
            blurRadius: 20,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: [
          RadialAxis(
            radiusFactor: 0.7,
            axisLineStyle: AxisLineStyle(
              thickness: 20,
              color: Colors.grey.shade300,
            ),
            // axisLineStyle: AxisLineStyle(
            //   thickness: 0.2,
            //   thicknessUnit: GaugeSizeUnit.factor,
            //   cornerStyle: CornerStyle.bothCurve,
            //   color: Colors.grey.shade300,
            // ),
            startAngle: 145,
            endAngle: 270,
            showLabels: false,
            showTicks: false,
            annotations: [
              GaugeAnnotation(
                widget: Container(
                  height: size.width > 1800
                      ? 150
                      : size.width < 1500
                      ? 90
                      : 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 227, 228, 245),
                        spreadRadius: 4,
                        blurRadius: 20,
                        offset: Offset(4, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "82.3%",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                angle: 270,
                positionFactor: 0,
              ),
            ],
          ),
          RadialAxis(
            radiusFactor: 0.8,
            pointers: [
              RangePointer(
                value: 100,
                gradient: SweepGradient(
                  colors: colorsBlue,
                  stops: [0.0, 0.33, 0.66, 1.0],
                ),
                width: 50,
              ),
            ],
            startAngle: 270,
            endAngle: 0,
            showLabels: false,
            showTicks: false,
            showAxisLine: false,
          ),
          RadialAxis(
            radiusFactor: 0.8,
            pointers: [
              RangePointer(
                value: 100,
                gradient: SweepGradient(
                  colors: colorsBlue,
                  stops: [0.0, 0.33, 0.66, 1.0],
                ),
                width: 50,
              ),
            ],
            startAngle: 270,
            endAngle: 0,
            showLabels: false,
            showTicks: false,
            showAxisLine: false,
          ),
          RadialAxis(
            radiusFactor: 0.76,
            pointers: [
              RangePointer(
                value: 55,
                gradient: SweepGradient(
                  colors: colorsGreen,
                  stops: [0.0, 0.33, 0.66, 1.0],
                ),
                width: 36,
              ),
            ],
            startAngle: 0,
            endAngle: 270,
            showLabels: false,
            showTicks: false,
            showAxisLine: false,
          ),
          RadialAxis(
            radiusFactor: 0.76,
            pointers: [
              RangePointer(
                value: 55,
                gradient: SweepGradient(
                  colors: colorsGreen,
                  stops: [0.0, 0.33, 0.66, 1.0],
                ),
                width: 36,
              ),
            ],
            startAngle: 0,
            endAngle: 270,
            showLabels: false,
            showTicks: false,
            showAxisLine: false,
          ),
        ],
      ),
    );
  }
}
