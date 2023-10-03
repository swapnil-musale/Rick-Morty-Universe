import 'package:rick_morty_universe/features/authentication/domain/entities/auth_user.dart';
import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart';

class AuthenticateUserUseCase {
  final AuthRepository authRepository;

  AuthenticateUserUseCase({required this.authRepository});

  Future<AuthUser> call({
    required String email,
    required String password,
  }) async {
    try {
      return await authRepository.authenticateUser(
        email: email,
        password: password,
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
