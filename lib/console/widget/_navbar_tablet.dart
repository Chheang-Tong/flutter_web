import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testing_w/core/providers/drawer_provider.dart';
import 'package:testing_w/core/res/responsive.dart';

class NavbarTablet extends StatefulWidget {
  const NavbarTablet({super.key});

  @override
  State<NavbarTablet> createState() => _NavbarTabletState();
}

class _NavbarTabletState extends State<NavbarTablet> {
  @override
  Widget build(BuildContext context) {
    final drawProvider = Provider.of<DrawerProvider>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (drawProvider.scafoldKey.currentState != null) {
                drawProvider.scafoldKey.currentState!.openDrawer();
              }
            },
            icon: Icon(Icons.menu, size: 28, color: Colors.black54),
          ),
          Expanded(child: SizedBox()),
          if (Responsive.isTablet(context))
            Container(
              width: 200,
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: TextFormField(
                cursorColor: Colors.black,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset('asset/icon/search.svg', width: 25),
                  hintText: 'Search...',
                  hintStyle: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

          SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('asset/icon/mail.svg', width: 25),
          ),

          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('asset/icon/bell.svg', width: 25),
          ),
        ],
      ),
    );
  }
}
