// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:regardless_data_module/app/app.logger.dart';
import 'package:regardless_data_module/app/services/social_auth_service.dart';
import 'package:regardless_data_module/domain/repositories/media_repository.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../data/local/session_manager_service.dart';
import '../data/remote/api_service_impl.dart';
import '../data/remote/repository/auth_repository_impl.dart';
import '../data/remote/repository/community_repository_impl.dart';
import '../data/remote/repository/event_repository_imp.dart';
import '../data/remote/repository/media_repository_impl.dart';
import '../data/remote/repository/post_repository_impl.dart';
import '../data/remote/repository/service_repository_impl.dart';
import '../data/remote/repository/team_repository_impl.dart';
import '../data/remote/repository/user_repository_impl.dart';
import '../domain/api/api_service.dart';
import '../domain/model/session_manager.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/community_repository.dart';
import '../domain/repositories/event_repository.dart';
import '../domain/repositories/post_repository.dart';
import '../domain/repositories/service_repository.dart';
import '../domain/repositories/team_repository.dart';
import '../domain/repositories/user_repository.dart';
import 'services/cache_service.dart';
import 'services/firebase_messaging_service.dart';
import 'services/geocoder_service_impl.dart';
import 'services/location_service.dart';
import 'services/places_service_impl.dart';
import 'services/toast_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final module = StackedLocator.instance;

Future<void> initFirebase(bool useEmualator, {String url = 'localhost'}) async {
  getLogger('AppLocator').d('Initializing Firebase => $url');
  await Firebase.initializeApp();
  if (useEmualator) {
    FirebaseAuth.instance.useAuthEmulator(url, 9191);
    FirebaseFirestore.instance.useFirestoreEmulator(
      url,
      8081,
    );
    FirebaseFirestore.instance.settings = const Settings(
        // persistenceEnabled: true,
        );
  }
}

Future<void> initDataModule(
    {String? environment,
    EnvironmentFilter? environmentFilter,
    required String boxName}) async {
// Register environments
  module.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);
  await Hive.initFlutter();
  await Hive.openBox(boxName);

// Register dependencies
  module.registerLazySingleton(() => LocationService());
  module.registerLazySingleton(() => SocialAuthService());

  module.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  module.registerLazySingleton(() => ToastService());
  module
      .registerLazySingleton<SessionManager>(() => SessionManagerImpl(boxName));
  module.registerLazySingleton(() => FirebaseMessageService());
  module.registerLazySingleton<PlacesService>(() => PlacesServiceImpl());
  module.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  module.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  module.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());
  module.registerLazySingleton<CommunityRepository>(
      () => CommunityRepositoryImpl());
  module.registerLazySingleton<PostRepository>(() => PostRepositoryImpl());
  module.registerLazySingleton<MediaRepository>(() => MediaRepositoryImpl());
  module.registerLazySingleton<TeamRepository>(() => TeamRepositoryImpl());

  module
      .registerLazySingleton<ServiceRepository>(() => ServiceRepositoryImpl());
  module.registerLazySingleton<TGeocoder>(() => GeocoderImpl());
  module.registerLazySingleton<CacheService>(() => CacheServiceImpl());
}
