import 'package:injectable/injectable.dart';
import 'package:rockettest/domain/entities/user_entity.dart';
import 'package:rockettest/domain/repository/auth_repository.dart';

@lazySingleton
class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.register(email, password);
  }
}
