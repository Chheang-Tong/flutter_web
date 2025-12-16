import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_w/console/console_page.dart';
import 'package:testing_w/routes/app_router.gr.dart';
import 'package:testing_w/routes/error_page.dart';

class AppRouter {
  final String route;
  AppRouter(this.route);
  GoRouter get router {
    return GoRouter(
      initialLocation: route,
      routes: [
        GoRoute(
          name: AppRouterGr.dashboardRoute,
          path: '/:section',
          builder: (context, state) {
            final String section = state.pathParameters['section']!;
            return ConsolePage(section: section);
          },
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage(child: ErrorPage()),
    );
  }
}
