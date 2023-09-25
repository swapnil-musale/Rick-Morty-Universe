import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_morty_universe/features/dashboard/data/models/characters_response_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/character')
  Future<CharactersResponseModel> getCharacters();
}
