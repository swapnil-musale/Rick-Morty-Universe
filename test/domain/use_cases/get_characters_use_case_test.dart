import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_characters_use_case.dart';

import '../../data/repositories/dashboard_repository_impl_test.mocks.dart';

void main() {
  late MockDashboardRepositoryTest mockDashboardRepositoryTest;
  late GetCharactersUseCase getCharactersUseCase;

  List<CharacterItem> list = [
    CharacterItem(
      id: 1,
      name: 'Anime',
      status: 'Alive',
      species: 'Human',
      type: '',
      gender: 'Male',
      image: '',
      url: '',
      created: '',
    )
  ];

  setUp(() {
    mockDashboardRepositoryTest = MockDashboardRepositoryTest();
    getCharactersUseCase =
        GetCharactersUseCase(dashBoardRepository: mockDashboardRepositoryTest);
  });

  CharactersResponse charactersResponse = CharactersResponse(
    info: CharacterInfo(),
    characterList: list,
  );

  test(
    'on dashboard screen visible should get characters from network',
    () async {
      // Arrange
      when(mockDashboardRepositoryTest.getCharacters())
          .thenAnswer((_) => Future(() => charactersResponse));

      // Act
      final result = await getCharactersUseCase.call();

      // Asset
      expect(result, charactersResponse);
    },
  );
}
