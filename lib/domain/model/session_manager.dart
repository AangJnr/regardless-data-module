import '../../data/local/session_manager_service.dart';
import 'user.dart';
import 'venue.dart';

abstract class SessionManager {
  bool isLoggedIn();
  bool isFirstRun();
  void setUserAsLoggedIn();
  void setOnBoardingCompleted();
  void setAppState(AppState state);
  AppState getAppState();
  String? getRefreshToken();
  void setRefreshToken(String? token);
  String? getAccessToken();
  void setAccessToken(String? token);
  String getEmail();
  void setEmail(String? email);
  void setUserProfile(AUser user);
  AUser getUserProfile();
  void invalidate();
  void set(String key, String value);
  String get(String key);
  List<Venue> getLocations();
  void addLocation(Venue location);
  UserType getUserType();
  void setUserType(UserType state);
  void setNotificationCount([int count = 1]);
  int getNotificationCount();
  void increaseNotificationCount();
  double getDistance();
  void setDistance(double newValue);
}
