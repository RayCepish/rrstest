import 'package:injectable/injectable.dart';
import 'package:rockettest/domain/entities/user_entity.dart';
import 'package:rockettest/domain/repository/auth_repository.dart';

@lazySingleton
class SignInUseCase {
  final AuthRepository repository;
  SignInUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
