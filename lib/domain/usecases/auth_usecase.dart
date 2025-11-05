import 'package:injectable/injectable.dart';
import 'package:rockettest/domain/repository/auth_repository.dart';

@lazySingleton
class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);

  Future<void> call() => repository.logout();
}
