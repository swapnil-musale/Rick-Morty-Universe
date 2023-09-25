import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetCharactersUseCase {
  final DashBoardRepository dashBoardRepository;

  GetCharactersUseCase({required this.dashBoardRepository});

  Future<CharactersResponse> call() async {
    try {
      return await dashBoardRepository.getCharacters();
    } catch (error) {
      throw Exception(error);
    }
  }
}
