import 'package:dio/dio.dart';

class PokedexRepository {
  final _dio = Dio();

  Future getPokedexList() async {
    const offset = '20';
    const limit = '20';
    final queryParameters = {
      "offset": offset,
      "limit": limit,
    };
    try {
      final result = _dio.get(
        'https://pokeapi.co/api/v2/pokemon',
        queryParameters: queryParameters,
      );

      return result;
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
