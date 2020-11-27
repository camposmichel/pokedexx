import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/models/pokemon_details_model.dart';
import 'package:pokedexx/app/models/pokemon_model.dart';

part 'pokemon_repository.g.dart';

@Injectable()
class PokemonRepository extends Disposable {
  final Dio _dio;

  PokemonRepository(this._dio);

  @override
  void dispose() {}

  Future<PokemonResponse> getPokemons({String params}) async {
    final Response response = await _dio.get('/pokemon$params');
    return PokemonResponse.fromJson(response.data);
  }

  Future<PokemonDetailsModel> getPokemonDetails(String id) async {
    final Response response = await _dio.get('/pokemon/$id');
    return PokemonDetailsModel.fromJson(response.data);
  }
}
