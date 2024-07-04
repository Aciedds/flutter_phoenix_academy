// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_core/firebase_core.dart' as _i5;
import 'package:flutter_phoenix_academy/config/di/modules/injection_modules.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModules = _$InjectionModules();
    gh.lazySingleton<_i3.FirebaseFirestore>(
        () => injectionModules.cloudFireStore);
    gh.lazySingleton<_i4.FirebaseAuth>(() => injectionModules.firebaseAuth);
    gh.lazySingleton<_i5.FirebaseApp>(() => injectionModules.firebaseApp);
    return this;
  }
}

class _$InjectionModules extends _i6.InjectionModules {}
