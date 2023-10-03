import 'package:flutter/material.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/character/character_item_widget.dart';
import 'package:rick_morty_universe/features/injection_container.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late GetCharactersUseCase getCharactersUseCase;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    getCharactersUseCase = serviceLocator<GetCharactersUseCase>();
  }

  @override
  Widget build(BuildContext context) {
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
