import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  final scafoldKey1 = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scafoldKey => scafoldKey1;
}
