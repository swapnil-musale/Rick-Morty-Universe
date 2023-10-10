import 'package:dio/dio.dart';
import 'package:rick_morty_universe/features/dashboard/domain/use_cases/get_favorite_characters_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/sources/local/app_database.dart';
import 'core/sources/network/api_service.dart';
import 'features/authentication/data/repositories/auth_repository_impl.dart';
import 'features/authentication/domain/use_cases/authenticate_user_use_case.dart';
import 'features/authentication/domain/use_cases/sign_out_use_case.dart';
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'features/dashboard/domain/use_cases/delete_character_from_local_use_case.dart';
import 'features/dashboard/domain/use_cases/get_character_from_id_use_case.dart';
import 'features/dashboard/domain/use_cases/get_characters_use_case.dart';
import 'features/dashboard/domain/use_cases/save_character_in_local_use_case.dart';

part 'providers.g.dart';

@riverpod
Future<ApiService> getApiService(GetApiServiceRef ref) async {
  return ApiService(Dio(BaseOptions(contentType: 'application/json')));
}

@riverpod
Future<SharedPreferences> getSharedPreference(GetSharedPreferenceRef ref) {
  return SharedPreferences.getInstance().then((value) => value);
}

@riverpod
Future<AppDatabase> getAppDatabase(GetAppDatabaseRef ref) async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

@riverpod
AuthRepositoryImpl getAuthRepositoryImpl(GetAuthRepositoryImplRef ref) {
  final sharedPreferences = ref.watch(getSharedPreferenceProvider).requireValue;
  return AuthRepositoryImpl(sharedPreferences: sharedPreferences);
}

@riverpod
AuthenticateUserUseCase getAuthenticateUserUseCase(
    GetAuthenticateUserUseCaseRef ref) {
  final authRepository = ref.watch(getAuthRepositoryImplProvider);
  return AuthenticateUserUseCase(authRepository: authRepository);
}

@riverpod
Future<SignOutUseCase> getSignOutUseCase(GetSignOutUseCaseRef ref) async {
  final authRepository = ref.watch(getAuthRepositoryImplProvider);
  return SignOutUseCase(authRepository: authRepository);
}

@riverpod
DashBoardRepositoryImpl getDashboardRepository(GetDashboardRepositoryRef ref) {
  final appDatabase = ref.watch(getAppDatabaseProvider).requireValue;
  final apiService = ref.watch(getApiServiceProvider).requireValue;
  return DashBoardRepositoryImpl(
      appDatabase: appDatabase, apiService: apiService);
}

@riverpod
GetCharactersUseCase getCharactersUseCase(GetCharactersUseCaseRef ref) {
  final dashboardRepository =
      ref.watch(getDashboardRepositoryProvider);
  return GetCharactersUseCase(dashBoardRepository: dashboardRepository);
}

@riverpod
GetFavoriteCharactersUseCase getFavoriteCharactersUseCase(
    GetFavoriteCharactersUseCaseRef ref) {
  final dashboardRepository =
      ref.watch(getDashboardRepositoryProvider);
  return GetFavoriteCharactersUseCase(dashBoardRepository: dashboardRepository);
}

@riverpod
GetCharacterUseCase getCharacterUseCase(GetCharacterUseCaseRef ref) {
  final dashboardRepository =
      ref.watch(getDashboardRepositoryProvider);
  return GetCharacterUseCase(dashBoardRepository: dashboardRepository);
}

@riverpod
SaveCharacterInLocalUseCase getSaveCharacterInLocalUseCase(
    GetSaveCharacterInLocalUseCaseRef ref) {
  final dashboardRepository =
      ref.watch(getDashboardRepositoryProvider);
  return SaveCharacterInLocalUseCase(dashBoardRepository: dashboardRepository);
}

@riverpod
DeleteCharacterFromLocalUseCase getDeleteCharacterFromLocalUseCase(
    GetDeleteCharacterFromLocalUseCaseRef ref) {
  final dashboardRepository =
      ref.watch(getDashboardRepositoryProvider);
  return DeleteCharacterFromLocalUseCase(
      dashBoardRepository: dashboardRepository);
}
