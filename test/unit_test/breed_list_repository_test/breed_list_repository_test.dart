import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const _connectTimeout = Duration(seconds: 5);
  final _dio = Dio(
    BaseOptions(
        baseUrl: 'https://dog.ceo/api/breeds',
        headers: {"Content-Type": "application/json"},
        connectTimeout: _connectTimeout,
        receiveTimeout: _connectTimeout),
  );
  test('Testing getBreeds', () async {
    final _response = await _dio.get('/list/all');
    expect(_response.statusCode, 200);
  });
}
