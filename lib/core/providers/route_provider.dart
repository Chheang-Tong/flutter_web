import 'dart:html' as html;
import 'package:flutter/material.dart';

class RouteProvider extends ChangeNotifier {
  String? _saveRoute;
  // Method to save route to local storage
  void saveRouteToLocalStorage(String route) {
    html.window.localStorage['saved_route'] = route;
    _saveRoute = route;
    notifyListeners();
  }

  // Method to get saved route from local storage
  String? getRouteFromLocalStorage() {
    _saveRoute = html.window.localStorage['saved_route'];
    return _saveRoute;
  }

  // Method to clear saved route from local storage
  void clearRouteFromLocalStorage() {
    html.window.localStorage.remove('saved_route');
    _saveRoute = null;
    notifyListeners();
  }
}
