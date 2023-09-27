import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_universe/core/sources/local/app_database.dart';
import 'package:rick_morty_universe/core/sources/network/api_service.dart';
import 'package:rick_morty_universe/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:rick_morty_universe/features/authentication/domain/use_cases/authenticate_user_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/delete_character_from_local_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_character_from_id_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/save_character_in_local_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/domain/use_cases/sign_out_use_case.dart';
import 'dashboard/domain/use_cases/get_favorite_characters_use_case.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  serviceLocator.registerSingleton<AppDatabase>(database);

  final preference = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(sharedPreferences: preference));

  serviceLocator.registerSingleton<Dio>(
      Dio(BaseOptions(contentType: 'application/json')));

  serviceLocator.registerSingleton<ApiService>(ApiService(serviceLocator()));

  serviceLocator.registerSingleton<DashBoardRepository>(
      DashBoardRepositoryImpl(appDatabase: serviceLocator(), apiService: serviceLocator()));

  serviceLocator.registerFactory<AuthenticateUserUseCase>(
      () => AuthenticateUserUseCase(authRepository: serviceLocator()));

  serviceLocator.registerFactory<DeleteCharacterFromLocalUseCase>(
      () => DeleteCharacterFromLocalUseCase(dashBoardRepository: serviceLocator()));

  serviceLocator.registerFactory<GetCharacterUseCase>(
      () => GetCharacterUseCase(dashBoardRepository: serviceLocator()));

  serviceLocator.registerFactory<GetCharactersUseCase>(
      () => GetCharactersUseCase(dashBoardRepository: serviceLocator()));

  serviceLocator.registerFactory<SaveCharacterInLocalUseCase>(
      () => SaveCharacterInLocalUseCase(dashBoardRepository: serviceLocator()));

  serviceLocator.registerFactory<GetFavoriteCharactersUseCase>(
      () => GetFavoriteCharactersUseCase(dashBoardRepository: serviceLocator()));

  serviceLocator.registerFactory<SignOutUseCase>(
      () => SignOutUseCase(authRepository: serviceLocator()));
}
