import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_favorite_characters_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/character/character_item_widget.dart';
import 'package:rick_morty_universe/providers.dart';

class FavoriteCharacterScreen extends ConsumerStatefulWidget {
  const FavoriteCharacterScreen({super.key});

  @override
  ConsumerState<FavoriteCharacterScreen> createState() =>
      _FavoriteCharacterScreenState();
}

class _FavoriteCharacterScreenState
    extends ConsumerState<FavoriteCharacterScreen> {
  late GetFavoriteCharactersUseCase getFavoriteCharactersUseCase;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    getFavoriteCharactersUseCase =
        ref.watch(getFavoriteCharactersUseCaseProvider);

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getFavoriteCharactersUseCase(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return NotificationListener(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return CharacterItemWidget(
                      characterItem: snapshot.data![index],
                    );
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
