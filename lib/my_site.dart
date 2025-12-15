import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:testing_w/core/providers/drawer_provider.dart';
import 'package:testing_w/routes/app_router.dart';

class MySite extends StatefulWidget {
  const MySite({super.key});

  @override
  State<MySite> createState() => _MySiteState();
}

class _MySiteState extends State<MySite> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DrawerProvider())],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp.router(
          title: 'My Site',
          theme: ThemeData(primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          routerConfig:AppRouter().router,
        ),
      ),
    );
  }
}
