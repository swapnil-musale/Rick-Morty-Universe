class CharactersResponse {
  final CharacterInfo? info;
  final List<CharacterItem> characterList;

  CharactersResponse({required this.info, required this.characterList});

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class CharacterInfo {
  int? count;
  int? pages;
  String? next;
  String? prev;

  CharacterInfo({this.count, this.pages, this.next, this.prev});
}

class CharacterItem {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  CharacterItem(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});
}
