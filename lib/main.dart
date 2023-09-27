import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/core/navigation/app_routes.dart';
import 'package:rick_morty_universe/di/injection.dart';
import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:rick_morty_universe/features/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  configureDependencies();
  SharedPreferences.getInstance().then((pref) {
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  });
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
      initialRoute: _getInitialRoute(),
    );
  }

  String _getInitialRoute() {
    final AuthRepository authRepository = serviceLocator<AuthRepository>();
    if (authRepository.getIsOnboardingOpened()) {
      if (authRepository.getUserLoggedIn()) {
        return "/dashboard";
      } else {
        return "/authentication";
      }
    } else {
      authRepository.setIsOnboardingOpened(true);
      return "/onboarding";
    }
  }
}
