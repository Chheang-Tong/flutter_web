// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:testing_w/change/colors.dart';

class Sidebar extends StatefulWidget {
  final Function(String) onSelectPage;
  final String selectedPage;
  const Sidebar({
    super.key,
    required this.onSelectPage,
    required this.selectedPage,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width > 1800
          ? 270
          : size.width < 1140
          ? 220
          : 270,
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 40, top: 30),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'asset/icon/test.svg',
                        width: 50,
                        // color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Talking',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Admin',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SidebarItem(
                  title: 'Dashboard',
                  iconPath: 'asset/icon/home.svg',
                  isSelected: widget.selectedPage == 'dashboard',
                  onTap: () => widget.onSelectPage('dashboard'),
                ),
                SidebarItem(
                  title: 'Order',
                  iconPath: 'asset/icon/cart.svg',
                  isSelected: widget.selectedPage == 'order',
                  onTap: () => widget.onSelectPage('order'),
                ),
                SidebarItem(
                  title: 'Analytics',
                  iconPath: 'asset/icon/chart.svg',
                  isSelected: widget.selectedPage == 'analytics',
                  onTap: () => widget.onSelectPage('analytics'),
                ),
                SidebarItem(
                  title: 'Customer',
                  iconPath: 'asset/icon/customer.svg',
                  isSelected: widget.selectedPage == 'customer',
                  onTap: () => widget.onSelectPage('customer'),
                ),
                SidebarItem(
                  title: 'Menu',
                  iconPath: 'asset/icon/menu.svg',
                  isSelected: widget.selectedPage == 'menu',
                  onTap: () => widget.onSelectPage('menu'),
                ),
                Expanded(child: SizedBox()),
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
                            overlayColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
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
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// TO DO: SidebarItem
class SidebarItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;
  const SidebarItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      iconPath,
                      height: 25,
                      width: 25,
                      color: isSelected ? Colors.white : Colors.black45,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        style: GoogleFonts.inter(
                          color: isSelected ? Colors.white : Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
