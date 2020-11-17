import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:pokedexx/app/models/pokemon_model.dart';

part 'pokemon_repository.g.dart';

@Injectable()
class PokemonRepository extends Disposable {
  final DioForNative _dio;

  PokemonRepository(this._dio);

  Future<List<PokemonModel>> getList() async {
    final Response response =
        await _dio.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=20');
    return (response.data as List)
        .map((item) => PokemonModel.fromJson(item))
        .toList();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
