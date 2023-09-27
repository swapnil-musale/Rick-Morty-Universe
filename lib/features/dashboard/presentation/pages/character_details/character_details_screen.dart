import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/delete_character_from_local_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_character_from_id_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/save_character_in_local_use_case.dart';
import 'package:rick_morty_universe/features/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_details_screen.g.dart';

@riverpod
Future<bool?> isCharacterFavorite(
  IsCharacterFavoriteRef ref, {
  required int id,
  required GetCharacterUseCase characterUseCase,
}) async {
  return await characterUseCase.call(id).then((value) => value?.isFavorite);
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
  late GetCharacterUseCase getCharacterUseCase;
  late SaveCharacterInLocalUseCase saveCharacterInLocalUseCase;
  late DeleteCharacterFromLocalUseCase deleteCharacterFromLocalUseCase;

  @override
  void initState() {
    getCharacterUseCase = serviceLocator<GetCharacterUseCase>();
    saveCharacterInLocalUseCase = serviceLocator<SaveCharacterInLocalUseCase>();
    deleteCharacterFromLocalUseCase = serviceLocator<DeleteCharacterFromLocalUseCase>();
    super.initState();
  }

  @override
  Scaffold build(BuildContext context) {
    final isFavorite = ref
        .watch(
          isCharacterFavoriteProvider(
            id: widget.characterItem.id ?? 0,
            characterUseCase: getCharacterUseCase,
          ),
        )
        .valueOrNull;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('${widget.characterItem.name} - Character Details'),
              ElevatedButton(
                onPressed: () async {
                  if (isFavorite == true) {
                    await deleteCharacterFromLocalUseCase
                        .call(widget.characterItem);
                    _showSnackBar('Character removed from Local');
                  } else {
                    widget.characterItem.isFavorite = true;
                    await saveCharacterInLocalUseCase
                        .call(widget.characterItem);
                    _showSnackBar('Character added into Local');
                  }
                },
                child: Text(
                  isFavorite == true
                      ? 'Remove from Favorite'
                      : 'Add To Favorite',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showSnackBar(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
