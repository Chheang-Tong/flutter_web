// import 'package:flutter/material.dart';

// class Responsive extends StatelessWidget {
//   final Widget mobile;
//   final Widget tablet;
//   final Widget desktop;

//   const Responsive({
//     super.key,
//     required this.mobile,
//     required this.tablet,
//     required this.desktop,
//   });

//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 600;

//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 600 &&
//       MediaQuery.of(context).size.width < 1024;

//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1024;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final width = constraints.maxWidth;
//         if (width >= 1024) {
//           return desktop;
//         } else if (width >= 600) {
//           return tablet;
//         } else {
//           return mobile;
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static const double mobileBp = 600;
  static const double desktopBp = 1024;

  /// 📱 Mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBp;

  /// 📲 Tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBp &&
      MediaQuery.of(context).size.width < desktopBp;

  /// 🖥 Desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBp;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= desktopBp) return desktop;
    if (width >= mobileBp) return tablet;
    return mobile;
  }
}

class TestWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const TestWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width >= Responsive.desktopBp) {
          return desktop;
        } else if (width >= Responsive.mobileBp) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
