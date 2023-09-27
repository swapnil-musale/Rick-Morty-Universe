import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  Future<void> call() async {
    try {
      return await authRepository.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }
}
