import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:three_window_layout/app/app.locator.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  asExtension: false,
  preferRelativeImports: true,
  ignoreUnregisteredTypes: []
)

void setupLocator() => $initGetIt(locator);
