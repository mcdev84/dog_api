import 'package:dio/dio.dart';
import 'package:dog_breeds/data/repositories/breed_list/breed_list_repository.dart';
import 'package:dog_breeds/domain/entities/dogs_entity/dogs_entity.dart';

class BreedListRepositoryImpl implements BreedListRepository {
  final Dio _dio;

  BreedListRepositoryImpl(this._dio);

  @override
  Future<Map<String, dynamic>> loadBreeds() async {
    try {
      final List<DogBreeds> _list = [];
      final _response = await _dio.get('breeds/list/all');
      return _response.data['message'];
    } on DioException catch (dioException) {
      rethrow;
    }
  }
}
