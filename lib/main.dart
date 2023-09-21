import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/core/navigation/app_routes.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:rick_morty_universe/features/onboarding/pages/on_boarding_screen.dart';
import 'package:rick_morty_universe/features/settings/presentation/pages/SettingsScreen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
      initialRoute: "/onboarding",
      home: const OnBoardingScreen(),
    );
  }
}
