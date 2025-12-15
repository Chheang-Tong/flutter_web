// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testing_w/change/colors.dart';

class MobileDrawer extends StatefulWidget {
  final Function selectedPage;
  const MobileDrawer({super.key, required this.selectedPage});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "asset/image/icon.jpg",
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hero',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Admin",
                        style: GoogleFonts.inter(
                          color: Colors.black45,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SidebarItem(
            title: 'Dashboard',
            icon: 'asset/icon/home.svg',
            onTap: () {
              widget.selectedPage('dashboard');
              Navigator.pop(context);
            },
          ),
          SidebarItem(
            title: 'Order',
            icon: 'asset/icon/cart.svg',

            onTap: () {
              widget.selectedPage('order');
              Navigator.pop(context);
            },
          ),
          SidebarItem(
            title: 'Analytics',
            icon: 'asset/icon/chart.svg',

            onTap: () {
              widget.selectedPage('analytics');
              Navigator.pop(context);
            },
          ),
          SidebarItem(
            title: 'Customer',
            icon: 'asset/icon/customer.svg',

            onTap: () {
              widget.selectedPage('customer');
              Navigator.pop(context);
            },
          ),
          SidebarItem(
            title: 'Menu',
            icon: 'asset/icon/menu.svg',

            onTap: () {
              widget.selectedPage('menu');
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 270,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: CircularPercentIndicator(
                      radius: 35,
                      lineWidth: 5,
                      percent: 0.86,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.transparent,
                      progressColor: primaryColor,
                      center: Text(
                        '86%',
                        style: GoogleFonts.inter(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Subscription Plan',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Your Subscription plan will expire soon. Please upgrade!!!',
                    style: GoogleFonts.inter(
                      color: Colors.black45,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  TextButton(
                    // style: TextButton.styleFrom(
                    //   backgroundColor: Colors.white,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   padding: EdgeInsets.symmetric(
                    //     vertical: 12,
                    //     horizontal: 20,
                    //   ),
                    // ),
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      ),
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Upgrade",
                      style: GoogleFonts.inter(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        height: 15,
        width: 15,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
      ),
      onTap: onTap,
    );
  }
}
