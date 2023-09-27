// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rick_morty_universe/features/authentication/data/repositories/auth_repository_impl.dart'
    as _i3;
import 'package:rick_morty_universe/features/authentication/domain/repositories/auth_repository.dart'
    as _i6;
import 'package:rick_morty_universe/features/authentication/domain/use_cases/authenticate_user_use_case.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthRepositoryImpl>(() =>
      _i3.AuthRepositoryImpl(sharedPreferences: gh<_i4.SharedPreferences>()));
  gh.singleton<_i5.AuthenticateUserUseCase>(
      _i5.AuthenticateUserUseCase(authRepository: gh<_i6.AuthRepository>()));
  return getIt;
}
