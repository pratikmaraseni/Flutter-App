import 'package:get_it/get_it.dart';

import '../screens/auth/change_password/service/change_password_service.dart';
import '../screens/auth/service/auth_service.dart';
import '../screens/event/service/event_service.dart';
import '../screens/profile/service/profile_service.dart';
import '../screens/score/service/score_service.dart';
import '../screens/timeline/service/timeline_service.dart';
import '../screens/youtube/service/youtube_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator.registerLazySingleton<ProfileService>(() => ProfileService());
  serviceLocator.registerLazySingleton<ScoreService>(() => ScoreService());
  serviceLocator.registerLazySingleton<YoutubeService>(() => YoutubeService());
  serviceLocator.registerLazySingleton<EventService>(() => EventService());
  serviceLocator
      .registerLazySingleton<TimelineService>(() => TimelineService());
  serviceLocator.registerLazySingleton<ChangePasswordService>(
      () => ChangePasswordService());
}
