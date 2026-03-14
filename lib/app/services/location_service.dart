import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'toast_service.dart';

class LocationService {
  int _intervalInSeconds = 20;

  StreamSubscription<Position>? _positionStream;
  late LocationPermission permission;

  void setLocationListener(
      {Function(Position locationData)? onUpdated,
      String? uid,
      int updateIntervalInSeconds = 20}) async {
    dispose();
    await requestLocationPermission();

    _intervalInSeconds = updateIntervalInSeconds;

    _positionStream = Geolocator.getPositionStream(
      locationSettings: _getSettings(),
    ).listen((Position position) async {
      debugPrint("Bearing => ${position.heading}");
      debugPrint('${position.latitude},${position.longitude}');
      debugPrint("Update interval => $_intervalInSeconds");

      onUpdated?.call(position);
    });
  }

  Future<bool> hasPermission() async {
    permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<Position?> getLastKnownLocation() async {
    requestLocationPermission();
    return Geolocator.getLastKnownPosition();
  }

  Future<Position> getCurrentLocation() async {
    await requestLocationPermission();
    return Geolocator.getCurrentPosition(
      locationSettings: _getSettings(),
    );
  }

  void dispose() async {
    _positionStream?.cancel();
  }

  Future<String> getAddressName(lat, lng) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lng);
    return Future.value(placemark[0].name ?? "");
  }

  LocationSettings _getSettings() {
    if (Platform.isAndroid) {
      return AndroidSettings(
          accuracy: LocationAccuracy.high,
          intervalDuration: Duration(seconds: _intervalInSeconds),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "The location service will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    }
    if (Platform.isAndroid) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    }
    return const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
  }

  Future<void> requestLocationPermission(
      {VoidCallback? onGranted, VoidCallback? onDenied}) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ToastService().showToast('Location services are disabled.');
      return;
    }

    permission = await Geolocator.requestPermission();
    debugPrint("LocationPermission => ${permission.toString()}");

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.deniedForever) {
      // Just notify — no forced redirect, no "OK goes to Settings"
      await DialogService()
          .showConfirmationDialog(
        title: 'Location required',
        description: 'This feature requires location access. '
            'You can enable it in Settings if you change your mind.',
        barrierDismissible: true,
        cancelTitle: 'Dismiss',
        confirmationTitle: 'Open Settings', // Optional, user-initiated
      )
          .then((value) async {
        if (value?.confirmed == true) {
          await Geolocator.openLocationSettings();
        }
      });

      onDenied?.call();
      return;
    }

    onGranted?.call();
  }
}
