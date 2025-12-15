import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_w/console/console_page.dart';
import 'package:testing_w/routes/app_router.gr.dart';
import 'package:testing_w/routes/error_page.dart';

class AppRouter {
  GoRouter get router {
    return GoRouter(
      initialLocation: '/dashboard',
      routes: [
        GoRoute(
          name: AppRouterGr.dashboardRoute,
          path: '/dashboard',
          builder: (context, state) => ConsolePage(),
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage(child: ErrorPage()),
    );
  }
}
