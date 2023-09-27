import 'package:floor/floor.dart';

class CharactersResponse {
  final CharacterInfo? info;
  final List<CharacterItem> characterList;

  CharactersResponse({required this.info, required this.characterList});
}

class CharacterInfo {
  int? count;
  int? pages;
  String? next;
  String? prev;

  CharacterInfo({this.count, this.pages, this.next, this.prev});
}

@entity
class CharacterItem {
  @primaryKey
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  String? url;
  String? created;
  bool? isFavorite;

  CharacterItem({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.url,
    this.created,
    this.isFavorite,
  });
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});
}
