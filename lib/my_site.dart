import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_w/core/providers/route_provider.dart';
import 'package:testing_w/routes/app_router.dart';
import 'package:testing_w/core/providers/order_provider.dart';
import 'package:testing_w/core/providers/drawer_provider.dart';

class MySite extends StatefulWidget {
  const MySite({super.key});

  @override
  State<MySite> createState() => _MySiteState();
}

class _MySiteState extends State<MySite> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => RouteProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          final routeProvider = Provider.of<RouteProvider>(context,listen: false);
          final saveRoute = routeProvider.getRouteFromLocalStorage();
          final route = saveRoute??"/dashboard";
          return MaterialApp.router(
            title: 'My Site',
            theme: ThemeData(primarySwatch: Colors.blue),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter(route).router,
          );
        },
      ),
    );
  }
}
