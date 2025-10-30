import 'package:flutter/material.dart';

class NavigationService {
  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();
}
