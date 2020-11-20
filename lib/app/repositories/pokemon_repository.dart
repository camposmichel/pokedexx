import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedexx/app/models/pokemon_model.dart';

part 'pokemon_repository.g.dart';

@Injectable()
class PokemonRepository extends Disposable {
  final Dio _dio;

  PokemonRepository(this._dio);

  Future<PokemonResponse> getPokemons({String params}) async {
    final Response response = await _dio.get('/pokemon$params');
    return PokemonResponse.fromJson(response.data);
  }

  @override
  void dispose() {}
}
