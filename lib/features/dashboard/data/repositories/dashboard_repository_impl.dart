import 'package:rick_morty_universe/core/sources/local/app_database.dart';
import 'package:rick_morty_universe/core/sources/network/api_service.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashBoardRepositoryImpl implements DashBoardRepository {
  final AppDatabase appDatabase;
  final ApiService apiService;

  DashBoardRepositoryImpl({
    required this.appDatabase,
    required this.apiService,
  });

  @override
  Future<CharactersResponse> getCharacters() async {
    try {
      final result = await apiService.getCharacters();
      return result.toEntity();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<CharacterItem?> getCharacter(int id) {
    return appDatabase.characterDao.getCharacter(id);
  }

  @override
  Future<void> saveCharacterInLocal(CharacterItem characterItem) {
    return appDatabase.characterDao.insertCharacter(characterItem);
  }

  @override
  Future<void> deleteCharacterFromLocal(CharacterItem characterItem) {
    return appDatabase.characterDao.deleteCharacter(characterItem);
  }

  @override
  Future<List<CharacterItem>> getAllFavoriteCharacters() async {
    return appDatabase.characterDao.getAllCharacterList();
  }
}
