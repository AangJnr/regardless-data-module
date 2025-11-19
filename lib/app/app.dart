import 'package:stacked/stacked_annotations.dart';

import '../data/local/session_manager_service.dart';
import '../data/remote/repository/auth_repository_impl.dart';
import '../data/remote/repository/event_repository_imp.dart';
import '../data/remote/repository/service_repository_impl.dart';
import '../data/remote/repository/team_repository_impl.dart';
import '../data/remote/repository/user_repository_impl.dart';
import '../domain/model/session_manager.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/event_repository.dart';
import '../domain/repositories/service_repository.dart';
import '../domain/repositories/team_repository.dart';
import '../domain/repositories/user_repository.dart';
import 'services/cache_service.dart';
import 'services/geocoder_service_impl.dart';
import 'services/places_service_impl.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [],
  dependencies: [
    LazySingleton(classType: SessionManagerImpl, asType: SessionManager),
    LazySingleton(classType: PlacesServiceImpl, asType: PlacesService),
    LazySingleton(classType: AuthRepositoryImpl, asType: AuthRepository),
    LazySingleton(classType: UserRepositoryImpl, asType: UserRepository),
    LazySingleton(classType: EventRepositoryImpl, asType: EventRepository),
    LazySingleton(classType: ServiceRepositoryImpl, asType: ServiceRepository),
    LazySingleton(classType: TeamRepositoryImpl, asType: TeamRepository),
    LazySingleton(classType: GeocoderImpl, asType: TGeocoder),
    LazySingleton(classType: CacheServiceImpl, asType: CacheService),
    // @stacked-service
  ],
  bottomsheets: [
    // @stacked-bottom-sheet
  ],
  dialogs: [
    // @stacked-dialog
  ],
)
class App {}
