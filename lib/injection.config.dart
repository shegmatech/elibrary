// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/book/book_serivce.dart' as _i4;
import 'infrastructure/auth/firebase_auth.dart' as _i7;
import 'infrastructure/book/book_repo.dart' as _i5;
import 'presentattion/routes/app_router.gr.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.BookService>(() => _i5.BookRepo());
  gh.lazySingleton<_i6.IAuthFacade>(() => _i7.FirebaseAuthFacade());
  return get;
}
