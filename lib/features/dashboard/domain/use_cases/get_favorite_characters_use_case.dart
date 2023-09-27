import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetFavoriteCharactersUseCase {
  final DashBoardRepository dashBoardRepository;

  GetFavoriteCharactersUseCase({required this.dashBoardRepository});

  Future<List<CharacterItem>> call() async {
    try {
      return await dashBoardRepository.getAllFavoriteCharacters();
    } catch (error) {
      throw Exception(error);
    }
  }
}
