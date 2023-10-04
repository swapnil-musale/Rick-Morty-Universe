import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/core/navigation/app_routes.dart';
import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:rick_morty_universe/providers.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: RickMortyApp()));
}

class RickMortyApp extends ConsumerWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      themeMode: ThemeMode.light,
      routes: AppRoutes.routes,
      initialRoute: _getInitialRoute(ref),
    );
  }

  String _getInitialRoute(WidgetRef ref) {
    final AuthRepository authRepository =
        ref.watch(getAuthRepositoryImplProvider);
    if (authRepository.getIsOnboardingOpened()) {
      if (authRepository.getUserLoggedIn()) {
        return '/dashboard';
      } else {
        return '/authentication';
      }
    } else {
      authRepository.setIsOnboardingOpened(true);
      return '/onboarding';
    }
  }
}
