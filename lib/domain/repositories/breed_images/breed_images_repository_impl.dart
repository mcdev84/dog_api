import 'package:dio/dio.dart';
import 'package:dog_breeds/data/repositories/breed_images/breed_images_repository.dart';

class BreedImagesRepositoryImpl extends BreedImagesRepository {
  final Dio _dio;

  BreedImagesRepositoryImpl(this._dio);

  /// Breed images [number]
  @override
  Future<List<String>> getAllBreedImages({required String breed}) async {
    final _response = await _dio.get('/breed/$breed/images');
    return List<String>.from(_response.data['message']);
  }

  @override
  Future<List<String>> getRandomNumberBreedImages(
      {required String breed, required int number}) async {
    final _response = await _dio.get('/breed/$breed/images/random/$number');
    return List<String>.from(_response.data['message']);
  }

  /// Sub breed images [number]
  @override
  Future<List<String>> getAllSubBreedImages(
      {required String breed, required String subreed}) async {
    final _response = await _dio.get('/breed/$breed/$subreed/images');
    return List<String>.from(_response.data['message']);
  }

  @override
  Future<List<String>> getRandomNumberSubBreedImages(
      {required String breed, required String subreed, int? number}) async {
    final _response =
        await _dio.get('/breeds/$breed/$subreed/images/random/$number');
    return List<String>.from(_response.data['message']);
  }

  /// Random image / images [number]
  @override
  Future<List<String>> getRandomImages({int? number}) async {
    final _response = await _dio.get('/breeds/image/random${number}');
    return List<String>.from(_response.data['message']);
  }
}
