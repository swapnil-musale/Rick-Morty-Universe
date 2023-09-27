import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetCharacterUseCase {
  final DashBoardRepository dashBoardRepository;

  GetCharacterUseCase({required this.dashBoardRepository});

  Future<CharacterItem?> call(int id) async {
    return await dashBoardRepository.getCharacter(id);
  }
}
