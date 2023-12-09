import 'package:dio/dio.dart';
import 'package:dog_breeds/data/repositories/breed_images/breed_images_repository.dart';
import 'package:dog_breeds/data/repositories/breed_list/breed_list_repository.dart';
import 'package:dog_breeds/domain/repositories/breed_images/breed_images_repository_impl.dart';
import 'package:dog_breeds/domain/repositories/breed_list/breed_list_impl.dart';
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

Future<void> initGetIt() async {
  final serviceLocator = GetIt.instance;

  // DIO
  serviceLocator.registerLazySingleton<Dio>(() => _providerDio());
  // REPOSITORIES
  serviceLocator.registerLazySingleton<BreedListRepository>(
      () => BreedListRepositoryImpl(serviceLocator.get()));
  serviceLocator.registerLazySingleton<BreedImagesRepository>(
      () => BreedImagesRepositoryImpl(serviceLocator.get()));
  // BLOCs
  serviceLocator.registerLazySingleton<HomepageBloc>(
      () => HomepageBloc(serviceLocator.get(), serviceLocator.get()));
}

Dio _providerDio() {
  const _connectTimeout = Duration(seconds: 5);
  final _dio = Dio(
    BaseOptions(
        baseUrl: dotenv.get("BASE_URL"),
        headers: {"Content-Type": "application/json"},
        connectTimeout: _connectTimeout,
        receiveTimeout: _connectTimeout),
  );

  return _dio;
}
