// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rockettest/data/data_sources/auth_api.dart' as _i870;
import 'package:rockettest/data/repositories_imp/auth_repository_impl.dart'
    as _i892;
import 'package:rockettest/dependency_injection/register_module.dart' as _i376;
import 'package:rockettest/domain/repository/auth_repository.dart' as _i180;
import 'package:rockettest/domain/usecases/auth_usecase.dart' as _i633;
import 'package:rockettest/domain/usecases/signin_usecase.dart' as _i611;
import 'package:rockettest/domain/usecases/signup_usecase.dart' as _i449;
import 'package:rockettest/presentation/bloc/auth_bloc.dart' as _i40;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.storage(),
    );
    gh.lazySingleton<_i870.AuthApi>(() => _i870.AuthApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i180.AuthRepository>(
      () => _i892.AuthRepositoryImpl(
        gh<_i870.AuthApi>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i633.LogoutUseCase>(
      () => _i633.LogoutUseCase(gh<_i180.AuthRepository>()),
    );
    gh.lazySingleton<_i611.SignInUseCase>(
      () => _i611.SignInUseCase(gh<_i180.AuthRepository>()),
    );
    gh.lazySingleton<_i449.SignUpUseCase>(
      () => _i449.SignUpUseCase(gh<_i180.AuthRepository>()),
    );
    gh.factory<_i40.AuthBloc>(
      () => _i40.AuthBloc(
        signInUseCase: gh<_i611.SignInUseCase>(),
        signUpUseCase: gh<_i449.SignUpUseCase>(),
        logoutUseCase: gh<_i633.LogoutUseCase>(),
        repository: gh<_i180.AuthRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i376.RegisterModule {}
