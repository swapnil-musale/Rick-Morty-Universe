import 'package:dio/dio.dart';
import 'package:rick_morty_universe/core/sources/network/api_service.dart';
import 'package:rick_morty_universe/features/dashboard/domain/entities/characters_response.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashBoardRepositoryImpl implements DashBoardRepository {
  final ApiService apiService = ApiService(Dio(BaseOptions(
    contentType: 'application/json',
  )));

  @override
  Future<CharactersResponse> getCharacters() async {
    try {
      final result = await apiService.getCharacters();
      return result.toEntity();
    } catch (error) {
      throw Exception(error);
    }
  }
}
