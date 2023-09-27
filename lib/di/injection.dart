import 'package:injectable/injectable.dart';
import 'package:rick_morty_universe/di/injection.config.dart';
import 'package:rick_morty_universe/features/injection_container.dart';

@InjectableInit(asExtension: false)
void configureDependencies() => init(serviceLocator);
