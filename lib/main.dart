import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/core/navigation/app_routes.dart';
import 'package:rick_morty_universe/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences.getInstance().then((pref) {
    runApp(
      ProviderScope(
        child: MyApp(
          sharedPreferences: pref,
        ),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({super.key, required this.sharedPreferences});

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
      initialRoute: _getInitialRoute(sharedPreferences: sharedPreferences),
    );
  }

  String _getInitialRoute({required SharedPreferences sharedPreferences}) {
    final AuthRepository authRepository =
        AuthRepositoryImpl(sharedPreferences: sharedPreferences);
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
