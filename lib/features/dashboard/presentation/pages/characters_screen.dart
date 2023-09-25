import 'package:flutter/material.dart';
import 'package:rick_morty_universe/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/character_details_screen.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late GetCharactersUseCase getCharactersUseCase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
                future: getCharactersUseCase.call(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.characterList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CharacterDetailsScreen(
                                      characterItem:
                                      snapshot.data!.characterList[index],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            snapshot.data!.characterList[index].name ?? '',
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final DashBoardRepository dashBoardRepository = DashBoardRepositoryImpl();
    getCharactersUseCase =
        GetCharactersUseCase(dashBoardRepository: dashBoardRepository);
  }
}
