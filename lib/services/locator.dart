import 'package:get_it/get_it.dart';
import 'package:leaf_for_business/router/web_router.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => WebRouter());
}
