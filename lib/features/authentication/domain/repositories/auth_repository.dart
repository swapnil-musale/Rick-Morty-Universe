import 'package:rick_morty_universe/features/authentication/domain/entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> authenticateUser({
    required String email,
    required String password,
  });

  Future<void> signOut();

  void setUserLoggedIn(bool value);

  bool getUserLoggedIn();

  bool getIsOnboardingOpened();

  void setIsOnboardingOpened(bool value);
}
