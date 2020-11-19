import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:pokedexx/app/models/pokemon_model.dart';

part 'pokemon_repository.g.dart';

@Injectable()
class PokemonRepository extends Disposable {
  final Dio _dio;

  PokemonRepository(this._dio);

  Future<List<PokemonModel>> getList() async {
    final Response response = await _dio.get('/pokemon');
    return (response.data['results'] as List)
        .map((item) => PokemonModel.fromJson(item))
        .toList();
  }

  @override
  void dispose() {}
}
