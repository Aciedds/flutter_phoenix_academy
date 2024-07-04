import 'package:flutter_phoenix_academy/config/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final inject = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => inject.init();
