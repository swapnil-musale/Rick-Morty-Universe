import 'dart:async';

import 'package:floor/floor.dart';
import 'package:rick_morty_universe/core/sources/local/dao/character_dao.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [CharacterItem])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get characterDao;
}

Future<AppDatabase> getAppDatabase() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}
