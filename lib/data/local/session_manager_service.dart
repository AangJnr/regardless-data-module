// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:regardless_data_module/data/model/venue_api.dart';
import 'package:regardless_data_module/domain/model/venue.dart';

import '../../domain/model/session_manager.dart';
import '../../domain/model/user.dart';
import '../model/user_response/user_response.dart';

const appStateKey = "appStateKey";
const refreshTokenKey = "refreshTokenKey";
const accessTokenKey = "accessTokenKey";
const userStateKey = "userStateKey";

const emailKey = "emailKey";
const userProfileKey = "userProfileKey";
const userPreferenceKey = "userPreferenceKey";

const statusKey = "pStatusKey";
const vendorIdKey = "vendorKey";
const orderKey = "orderKey";
const ongoingOrderKey = "ongoingOrderKey";
const ongoingTripStatusKey = "ongoingTripStatusKey";
const cartItemsKey = "cartItemKey";
const billingAddressesKey = "billingAddressesKey";
const resetModeKey = "resetModeKey";
const shouldRefreshImpactViewKey = "shouldRefreshImpactViewKey";
const lastScannedItems = "lastScannedItems";
const fullTreePlanted = "fullTreePlanted";
const pointsEarnedDialogKey = "pointsEarnedDialogKey";
const userImpactKey = "userImpactKey";
const globalImpactKey = "globalImpactKey";
const reqardsKey = "reqardsKey";
const couponsKey = "couponsKey";
const locationsKey = "locationsKey";
const notificationCountKey = 'notificationCountKey';
const distanceKey = 'distanceKey';

const NotificationKey = 'notification';
const NotificationReceivedKey = 'notification_received_key';

enum AppState {
  loggedIn,
  login,
  firstRun,
  verification,
  signUp,
  signUpPasswordInfo,
  selectCategory,
}

enum UserType { client, serviceProvider }

class SessionManagerImpl extends SessionManager {
  final String boxName;
  late final Box _hiveBox;
  SessionManagerImpl(this.boxName) {
    _hiveBox = Hive.box(boxName);
  }

  @override
  void invalidate() {
    _hiveBox.clear();
    setAppState(AppState.login);
  }

  @override
  bool isFirstRun() {
    return _hiveBox.get(appStateKey) == AppState.firstRun.name;
  }

  @override
  bool isLoggedIn() {
    return _hiveBox.get(appStateKey) == AppState.loggedIn.name;
  }

  @override
  void setUserAsLoggedIn() {
    _hiveBox.put(appStateKey, AppState.loggedIn.name);
  }

  @override
  void setOnBoardingCompleted() {
    _hiveBox.put(appStateKey, AppState.login.name);
  }

  @override
  String? getRefreshToken() {
    //Todo Encryption
    return _hiveBox.get(refreshTokenKey) as String?;
  }

  @override
  void setRefreshToken(String? token) {
    _hiveBox.put(refreshTokenKey, token);
  }

  @override
  String? getAccessToken() {
    //Todo Encryption
    return _hiveBox.get(accessTokenKey) as String?;
  }

  @override
  void setAccessToken(String? token) {
    _hiveBox.put(accessTokenKey, token);
  }

  @override
  AppState getAppState() {
    final v = AppState.values.firstWhere(
        (element) =>
            element.name == (_hiveBox.get(appStateKey) ?? AppState.signUp.name),
        orElse: () => AppState.signUp);
    return v;
  }

  @override
  void setAppState(AppState state) {
    _hiveBox.put(appStateKey, state.name);
  }

  @override
  UserType getUserType() {
    final v = UserType.values.firstWhere(
        (element) => element.name == (_hiveBox.get(userStateKey)),
        orElse: () => UserType.client);
    return v;
  }

  @override
  void setUserType(UserType state) {
    _hiveBox.put(userStateKey, state.name);
  }

  @override
  String getEmail() {
    return _hiveBox.get(emailKey) ?? "";
  }

  @override
  void setEmail(String? email) {
    _hiveBox.put(emailKey, email);
  }

  @override
  void setUserProfile(AUser user) {
    _hiveBox.put(userProfileKey, user.mapToApi().toJson());
  }

  @override
  AUser getUserProfile() {
    final data = _hiveBox.get(userProfileKey);
    if (data == null) return const AUser();
    return UserResponse.fromJson(data).mapToDomain();
  }

  @override
  void set(String key, String value) {
    _hiveBox.put(key, value);
  }

  @override
  String get(String key) {
    return _hiveBox.get(key, defaultValue: '');
  }

  @override
  List<Venue> getLocations() {
    final data = _hiveBox.get(locationsKey, defaultValue: '');
    if (data.isEmpty) return [];
    return (jsonDecode(data) as List<dynamic>)
        .map((element) => VenueApi.fromMap(element).mapToDomain())
        .toList();
  }

  @override
  void addLocation(Venue location) {
    final locations = getLocations();
    if (!locations.map((e) => e.address).contains(location.address)) {
      locations.insert(0, location);
    }

    _hiveBox.put(
        locationsKey,
        jsonEncode(
            locations.take(5).map((e) => e.mapToApi().toMap()).toList()));
  }

  @override
  int getNotificationCount() {
    return _hiveBox.get(notificationCountKey, defaultValue: 0);
  }

  @override
  void setNotificationCount([int count = 1]) {
    _hiveBox.put(notificationCountKey, count);
  }

  @override
  void increaseNotificationCount() {
    _hiveBox.put(notificationCountKey, getNotificationCount() + 1);
  }

  @override
  double getDistance() {
    return _hiveBox.get(distanceKey, defaultValue: 20.0) as double;
  }

  @override
  void setDistance(double newValue) {
    _hiveBox.put(distanceKey, newValue);
  }
}
