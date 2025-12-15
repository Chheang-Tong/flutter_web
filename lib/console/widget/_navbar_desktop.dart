import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Welcome Back',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Let's check your store today!!!",
                style: GoogleFonts.inter(color: Colors.black45, fontSize: 12),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
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
                hintStyle: GoogleFonts.inter(color: Colors.grey, fontSize: 14),
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
          SizedBox(width: 16),
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
                style: GoogleFonts.inter(color: Colors.black45, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
