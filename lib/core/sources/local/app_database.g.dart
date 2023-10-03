// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CharacterDao? _characterDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CharacterItem` (`id` INTEGER, `name` TEXT, `status` TEXT, `species` TEXT, `type` TEXT, `gender` TEXT, `image` TEXT, `url` TEXT, `created` TEXT, `isFavorites` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get characterDao {
    return _characterDaoInstance ??= _$CharacterDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _characterItemInsertionAdapter = InsertionAdapter(
            database,
            'CharacterItem',
            (CharacterItem item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'status': item.status,
                  'species': item.species,
                  'type': item.type,
                  'gender': item.gender,
                  'image': item.image,
                  'url': item.url,
                  'created': item.created,
                  'isFavorites': item.isFavorites == null
                      ? null
                      : (item.isFavorites! ? 1 : 0)
                }),
        _characterItemDeletionAdapter = DeletionAdapter(
            database,
            'CharacterItem',
            ['id'],
            (CharacterItem item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'status': item.status,
                  'species': item.species,
                  'type': item.type,
                  'gender': item.gender,
                  'image': item.image,
                  'url': item.url,
                  'created': item.created,
                  'isFavorites': item.isFavorites == null
                      ? null
                      : (item.isFavorites! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CharacterItem> _characterItemInsertionAdapter;

  final DeletionAdapter<CharacterItem> _characterItemDeletionAdapter;

  @override
  Future<List<CharacterItem>> getAllCharacterList() async {
    return _queryAdapter.queryList('SELECT * FROM CharacterItem',
        mapper: (Map<String, Object?> row) => CharacterItem(
            id: row['id'] as int?,
            name: row['name'] as String?,
            status: row['status'] as String?,
            species: row['species'] as String?,
            type: row['type'] as String?,
            gender: row['gender'] as String?,
            image: row['image'] as String?,
            url: row['url'] as String?,
            created: row['created'] as String?,
            isFavorites: row['isFavorites'] == null
                ? null
                : (row['isFavorites'] as int) != 0));
  }

  @override
  Future<CharacterItem?> getCharacter(int id) async {
    return _queryAdapter.query('SELECT * FROM CharacterItem WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CharacterItem(
            id: row['id'] as int?,
            name: row['name'] as String?,
            status: row['status'] as String?,
            species: row['species'] as String?,
            type: row['type'] as String?,
            gender: row['gender'] as String?,
            image: row['image'] as String?,
            url: row['url'] as String?,
            created: row['created'] as String?,
            isFavorites: row['isFavorites'] == null
                ? null
                : (row['isFavorites'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertCharacter(CharacterItem characterItem) async {
    await _characterItemInsertionAdapter.insert(
        characterItem, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCharacter(CharacterItem characterItem) async {
    await _characterItemDeletionAdapter.delete(characterItem);
  }
}
