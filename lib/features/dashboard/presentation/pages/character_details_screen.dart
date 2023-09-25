import 'package:flutter/material.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final CharacterItem characterItem;

  const CharacterDetailsScreen({super.key, required this.characterItem});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    widget.characterItem;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('${widget.characterItem.name} - Character Details'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add To Favorite'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
