import 'package:regardless_data_module/domain/model/new_user.dart';

import '../../data/local/session_manager_service.dart';
import 'preference.dart';
import 'reminder.dart';
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
  void setUser(AUser user);
  AUser getUserProfile();
  void saveNewUserData(NewUser newUser);
  void clearNewUserData();
  NewUser getNewUserData();
  void invalidate();
  void set(String key, dynamic value);
  dynamic get(String key);
  List<Venue> getLocations();
  void addLocation(Venue location);
  void setNotificationCount([int count = 1]);
  int getNotificationCount();
  void increaseNotificationCount();
  double getDistance();
  void setDistance(double newValue);
  void setPreferences(Preference preference);
  Preference getPreferences();
  void addReminder(Reminder reminder);
  List<Reminder> getReminders();
  void removeReminder(Reminder reminder);
}
