import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';
import 'package:rick_morty_universe/core/utils/Constants.dart';
import 'package:rick_morty_universe/features/authentication/data/models/auth_user_model.dart';
import 'package:rick_morty_universe/features/authentication/domain/entities/auth_user.dart';
import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthRepositoryImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth =
      firebase_auth.FirebaseAuth.instance;

  final SharedPreferences _sharedPreferences;

  AuthRepositoryImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<AuthUser> authenticateUser({
    required String email,
    required String password,
  }) async {
    try {
      firebase_auth.UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        setUserLoggedIn(true);
        return AuthUserModel.firebaseAuthUser(credential.user!).toEntity();
      } else {
        throw Exception("User is Null");
      }
    } on firebase_auth.FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        firebase_auth.UserCredential credential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        if (credential.user != null) {
          setUserLoggedIn(true);
          return AuthUserModel.firebaseAuthUser(credential.user!).toEntity();
        } else {
          throw Exception("User is Null");
        }
      } else {
        throw Exception(error);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  void setUserLoggedIn(bool value) {
    _sharedPreferences.setBool(Constants.KEY_IS_USER_LOGGED_IN, value);
  }

  @override
  bool getUserLoggedIn() {
    return _sharedPreferences.getBool(Constants.KEY_IS_USER_LOGGED_IN) ?? false;
  }

  @override
  bool getIsOnboardingOpened() {
    return _sharedPreferences.getBool(Constants.KEY_ONBOARDING_OPENED) ?? false;
  }

  @override
  void setIsOnboardingOpened(bool value) {
    _sharedPreferences.setBool(Constants.KEY_ONBOARDING_OPENED, value);
  }
}
