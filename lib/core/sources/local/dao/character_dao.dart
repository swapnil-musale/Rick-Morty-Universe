import 'package:floor/floor.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';

@dao
abstract class CharacterDao {

  @Query('SELECT * FROM CharacterItem')
  Future<List<CharacterItem>> getAllCharacterList();

  @Query('SELECT * FROM CharacterItem WHERE id = :id')
  Future<CharacterItem?> getCharacter(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCharacter(CharacterItem characterItem);

  @delete
  Future<void> deleteCharacter(CharacterItem characterItem);
}