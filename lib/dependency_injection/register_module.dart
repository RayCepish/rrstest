import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api/',
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': dotenv.env['REQRES_API_KEY'],
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  @lazySingleton
  FlutterSecureStorage storage() => const FlutterSecureStorage();
}
