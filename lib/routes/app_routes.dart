import 'package:flutter/material.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/monthly/monthly_screen.dart';
import '../screens/settings/settings_screen.dart';

class AppRoutes {
  static const String dashboard = '/';
  static const String monthly = '/monthly';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> get routes => {
        dashboard: (context) => const DashboardScreen(),
        monthly: (context) => const MonthlyScreen(),
        settings: (context) => const SettingsScreen(),
      };
}
