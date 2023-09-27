import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';

class SaveCharacterInLocalUseCase {
  final DashBoardRepository dashBoardRepository;

  SaveCharacterInLocalUseCase({required this.dashBoardRepository});

  Future<void> call(CharacterItem characterItem) {
    return dashBoardRepository.saveCharacterInLocal(characterItem);
  }
}