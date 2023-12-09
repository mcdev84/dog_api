import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class RandomImageRepository {
  Future<Either<DioException, String>> getRandomImage();
}
