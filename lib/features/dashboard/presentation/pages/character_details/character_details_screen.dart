import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/core/utils/string_ext.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/delete_character_from_local_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/save_character_in_local_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/character_details/character_info_text_widget.dart';
import 'package:rick_morty_universe/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_details_screen.g.dart';

@riverpod
Future<bool?> isCharacterFavorite(IsCharacterFavoriteRef ref,
    {required int characterId}) async {
  final getCharacterUseCase =
      ref.watch(getCharacterUseCaseProvider);
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
  Scaffold build(BuildContext context) {
    _saveCharacterInLocalUseCase =
        ref.watch(getSaveCharacterInLocalUseCaseProvider);
    _deleteCharacterFromLocalUseCase =
        ref.watch(getDeleteCharacterFromLocalUseCaseProvider);

    var isFavorite = ref
        .watch(isCharacterFavoriteProvider(
          characterId: widget.characterItem.id ?? 0,
        ))
        .valueOrNull;

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
                      child: FloatingActionButton(
                        child: Icon(
                          isFavorite == true ? Icons.star : Icons.star_border,
                          size: 32,
                        ),
                        onPressed: () async {
                          if (isFavorite == true) {
                            await _deleteCharacterFromLocalUseCase
                                .call(widget.characterItem);
                            ref.invalidate(
                              isCharacterFavoriteProvider(
                                characterId: widget.characterItem.id ?? 0,
                              ),
                            );
                          } else {
                            widget.characterItem.isFavorites = true;
                            await _saveCharacterInLocalUseCase
                                .call(widget.characterItem);
                            ref.invalidate(
                              isCharacterFavoriteProvider(
                                characterId: widget.characterItem.id ?? 0,
                              ),
                            );
                          }
                        },
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
