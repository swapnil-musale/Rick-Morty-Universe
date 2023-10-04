import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/character/character_item_widget.dart';
import 'package:rick_morty_universe/providers.dart';

class CharactersScreen extends ConsumerStatefulWidget {
  const CharactersScreen({super.key});

  @override
  ConsumerState<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends ConsumerState<CharactersScreen> {
  late GetCharactersUseCase getCharactersUseCase;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    getCharactersUseCase = ref.watch(getCharactersUseCaseProvider);

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getCharactersUseCase(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return NotificationListener(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: snapshot.data!.characterList.length,
                  itemBuilder: (context, index) {
                    return CharacterItemWidget(
                      characterItem: snapshot.data!.characterList[index],
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
