import 'package:flutter/material.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_favorite_characters_use_case.dart';
import 'package:rick_morty_universe/features/injection_container.dart';

class FavoriteCharacterScreen extends StatefulWidget {
  const FavoriteCharacterScreen({super.key});

  @override
  State<FavoriteCharacterScreen> createState() =>
      _FavoriteCharacterScreenState();
}

class _FavoriteCharacterScreenState extends State<FavoriteCharacterScreen> {
  late GetFavoriteCharactersUseCase getFavoriteCharactersUseCase;

  @override
  void initState() {
    getFavoriteCharactersUseCase = serviceLocator<GetFavoriteCharactersUseCase>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getFavoriteCharactersUseCase(),
          builder: (context, snapshot) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(
                  snapshot.data?[index].name ?? '',
                );
              },
            );
          },
        ),
      ),
    );
  }
}
