import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';

abstract class DashBoardRepository {
  Future<CharactersResponse> getCharacters();

  Future<CharacterItem?> getCharacter(int id);

  Future<void> saveCharacterInLocal(CharacterItem characterItem);

  Future<void> deleteCharacterFromLocal(CharacterItem characterItem);

  Future<List<CharacterItem>> getAllFavoriteCharacters();
}
