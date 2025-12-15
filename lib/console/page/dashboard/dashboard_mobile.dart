// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_w/console/widget/chart_column.dart';
import 'package:testing_w/console/widget/chart_radial.dart';
import 'package:testing_w/feature/model/chart_column_data.dart';
import 'package:testing_w/feature/model/data.dart';

class DashboardPageMobile extends StatefulWidget {
  const DashboardPageMobile({super.key});

  @override
  State<DashboardPageMobile> createState() => _DashboardPageMobileState();
}

class _DashboardPageMobileState extends State<DashboardPageMobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 450,
            child: Stack(
              children: [
                Image.asset(
                  'asset/image/banner.jpg',
                  height: 300,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 30,
                  bottom: 0,
                  left: 10,
                  right: 10,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, i) => Card(
                      shadowColor: Colors.black26,
                      color: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 10.0,
                            ),
                            child: Container(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          Positioned(
                            top: 24,
                            left: 24,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(data[i].icon),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  data[i].title,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  data[i].num,
                                  style: GoogleFonts.inter(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shadowColor: Colors.black26,
            surfaceTintColor: Colors.transparent,
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: size.width > 1800
                  ? 520
                  : size.width < 1550
                  ? 420
                  : 520,
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Revenue',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(height: 0, color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      '\$ 25,024.00',
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(child: ChartColumn()),
                  SizedBox(height: 20),
                  Row(
                    children: List.generate(
                      legendItemsColumn.length,
                      (i) => Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 24),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: LinearGradient(
                                colors: [
                                  legendItemsColumn[i].color.withOpacity(0.5),
                                  legendItemsColumn[i].color,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            legendItemsColumn[i].title,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),

          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shadowColor: Colors.black26,
            surfaceTintColor: Colors.transparent,
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: size.width > 1800
                  ? 520
                  : size.width < 1550
                  ? 420
                  : 520,
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Customer that buy our product',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(height: 0, color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: 16),
                  Expanded(child: ChartRadial()),
                  SizedBox(height: 20),
                  Row(
                    children: List.generate(
                      legendItemsRadial.length,
                      (i) => Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 24),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: legendItemsRadial[i].color,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            legendItemsRadial[i].title,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
