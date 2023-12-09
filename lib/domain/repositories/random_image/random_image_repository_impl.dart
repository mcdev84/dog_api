import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dog_breeds/data/repositories/random_image/random_image_repository.dart';

class RandomImageRepositoryImpl implements RandomImageRepository {
  final Dio _dio;

  RandomImageRepositoryImpl(this._dio);

  @override
  Future<Either<DioException, String>> getRandomImage({int? number}) async {
    final url = number != null ? 'image/random/$number' : 'image/random';
    try {
      final _response = await _dio.get(url);
      return Right(_response.data['message']);
    } on DioException catch (dioException) {
      return Left(dioException);
    }
  }
}
