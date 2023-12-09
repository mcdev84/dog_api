import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const _connectTimeout = Duration(seconds: 5);
  final _dio = Dio(
    BaseOptions(
        baseUrl: 'https://dog.ceo/api/breeds/',
        headers: {"Content-Type": "application/json"},
        connectTimeout: _connectTimeout,
        receiveTimeout: _connectTimeout),
  );
  test('Testing Random image(s)', () async {
    try {
      final _response = await _dio.get('image/random');
      expect(_response.statusCode, 200);
      expect(_response.data['message'].runtimeType, String);
    } on DioException catch (dioException) {
      expect(dioException.runtimeType, DioException);
    }
  });
}
