import 'package:flutter/material.dart';
import 'package:rick_morty_universe/features/authentication/presentation/pages/authentication_screen.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:rick_morty_universe/features/onboarding/pages/on_boarding_screen.dart';
import 'package:rick_morty_universe/features/settings/presentation/pages/SettingsScreen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    "/onboarding": (context) => const OnBoardingScreen(),
    "/authentication": (context) => const AuthenticationScreen(),
    "/dashboard": (context) => const DashboardScreen(),
    "/settings": (context) => const SettingsScreen(),
  };
}
