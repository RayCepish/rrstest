import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:rockettest/data/data_sources/auth_api.dart';
import 'package:rockettest/domain/entities/user_entity.dart';
import 'package:rockettest/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;
  final FlutterSecureStorage storage;

  AuthRepositoryImpl(this.api, this.storage);

  static const _tokenKey = 'access_token';

  @override
  Future<UserEntity> login(String email, String password) async {
    final res = await api.login({'email': email, 'password': password});

    await storage.write(key: _tokenKey, value: res.token);

    return UserEntity(id: res.id ?? 0, email: email, token: res.token);
  }

  @override
  Future<UserEntity> register(String email, String password) async {
    final res = await api.register({'email': email, 'password': password});

    await storage.write(key: _tokenKey, value: res.token);

    return UserEntity(id: res.id ?? 0, email: email, token: res.token);
  }

  @override
  Future<void> logout() async {
    await storage.delete(key: _tokenKey);
  }

  @override
  Future<bool> hasToken() async {
    final token = await storage.read(key: _tokenKey);
    return token != null;
  }
}
