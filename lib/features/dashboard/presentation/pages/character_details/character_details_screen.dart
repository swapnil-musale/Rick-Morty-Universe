import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/core/utils/string_ext.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/delete_character_from_local_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_character_from_id_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/save_character_in_local_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/character_details/character_info_text_widget.dart';
import 'package:rick_morty_universe/features/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_details_screen.g.dart';

@riverpod
Future<bool?> isCharacterFavorite(IsCharacterFavoriteRef ref,
    {required int characterId}) async {
  final getCharacterUseCase = serviceLocator.get<GetCharacterUseCase>();
  return await getCharacterUseCase
      .call(characterId)
      .then((value) => value?.isFavorites);
}

class CharacterDetailsScreen extends ConsumerStatefulWidget {
  final CharacterItem characterItem;

  const CharacterDetailsScreen({super.key, required this.characterItem});

  @override
  ConsumerState<CharacterDetailsScreen> createState() =>
      _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState
    extends ConsumerState<CharacterDetailsScreen> {
  late SaveCharacterInLocalUseCase _saveCharacterInLocalUseCase;
  late DeleteCharacterFromLocalUseCase _deleteCharacterFromLocalUseCase;

  @override
  void initState() {
    _saveCharacterInLocalUseCase =
        serviceLocator.get<SaveCharacterInLocalUseCase>();
    _deleteCharacterFromLocalUseCase =
        serviceLocator.get<DeleteCharacterFromLocalUseCase>();
    super.initState();
  }

  @override
  Scaffold build(BuildContext context) {
    var isFavorite = ref
        .watch(isCharacterFavoriteProvider(
          characterId: widget.characterItem.id ?? 0,
        ))
        .valueOrNull;
    print('Received : $isFavorite');

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          widget.characterItem.image.orEmpty(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          color: Theme.of(context).primaryColor,
                          child: IconButton(
                            icon: Icon(
                              isFavorite == true
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              if (isFavorite == true) {
                                print('remove');
                                await _deleteCharacterFromLocalUseCase
                                    .call(widget.characterItem);
                                isFavorite = ref
                                    .refresh(isCharacterFavoriteProvider(
                                  characterId: widget.characterItem.id ?? 0,
                                ))
                                    .valueOrNull;
                              } else {
                                print('add');
                                widget.characterItem.isFavorites = true;
                                await _saveCharacterInLocalUseCase
                                    .call(widget.characterItem);
                                isFavorite = ref
                                    .refresh(isCharacterFavoriteProvider(
                                      characterId: widget.characterItem.id ?? 0,
                                    ))
                                    .valueOrNull;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  widget.characterItem.name.orEmpty(),
                  style:
                      const TextStyle(fontSize: 36, color: Color(0xFF6750A4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterInfoTextWidget(
                        keyX: 'Status :',
                        valueX: widget.characterItem.status.orEmpty()),
                    CharacterInfoTextWidget(
                        keyX: 'Species :',
                        valueX: widget.characterItem.species.orEmpty()),
                    CharacterInfoTextWidget(
                        keyX: 'Gender :',
                        valueX: widget.characterItem.gender.orEmpty()),
                    CharacterInfoTextWidget(
                        keyX: 'Origin :',
                        valueX: widget.characterItem.status.orEmpty()),
                    CharacterInfoTextWidget(
                        keyX: 'Location :',
                        valueX: widget.characterItem.status.orEmpty()),
                    const CharacterInfoTextWidget(
                        keyX: 'Episodes :',
                        valueX:
                            '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
