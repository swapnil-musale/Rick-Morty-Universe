import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';

abstract class DashBoardRepository {
  Future<CharactersResponse> getCharacters();
}
