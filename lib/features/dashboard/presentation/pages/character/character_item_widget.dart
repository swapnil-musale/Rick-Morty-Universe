import 'package:flutter/material.dart';
import 'package:rick_morty_universe/core/utils/string_ext.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/character_details/character_details_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterItemWidget extends StatefulWidget {
  final CharacterItem characterItem;

  const CharacterItemWidget({super.key, required this.characterItem});

  @override
  State<CharacterItemWidget> createState() => _CharacterItemWidgetState();
}

class _CharacterItemWidgetState extends State<CharacterItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isExpanded,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 10, top: 180, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CharacterInfoTextWidget(
                      //   keyX: 'Name:',
                      //   valueX: '${widget.characterItem.name}',
                      // ),
                      Text('Name:      ${widget.characterItem.name}'),
                      Text('Species:   ${widget.characterItem.species}'),
                    ],
                  ),
                  FloatingActionButton(
                    child: const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailsScreen(
                            characterItem: widget.characterItem,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      foregroundDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.black.withOpacity(0.5)
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            height: 160,
                            width: double.infinity,
                            placeholder: MemoryImage(kTransparentImage),
                            image: NetworkImage(widget.characterItem.image!)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: !isExpanded,
                          child: Expanded(
                            child: Text(
                              widget.characterItem.name.orEmpty(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Icon(isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
