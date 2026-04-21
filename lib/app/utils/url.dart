import 'dart:io';

import 'package:flutter/foundation.dart';

enum Flavor { local, dev, prod }

class Url {
  static bool get isDebug {
    return _flavor == Flavor.local;
  }

  static String get firebaseEmulatorHost {
    if(kIsWeb) return '127.0.0.1';
    return Platform.isAndroid
        ? '10.36.214.182' //'10.0.2.2'
        : "127.0.0.1";
  }

  Url._();

  static Url get shared {
    return Url._();
  }

  static String get web {
    return Url._().webAddress;
  }

  static Flavor _flavor = Flavor.local;

  static String _url({String version = 'v1'}) {
    switch (_flavor) {
      case Flavor.local:
        return "http://$firebaseEmulatorHost:8080/api/$version";
      case Flavor.dev:
        return "https://regardless-api-dev-duzwdhkz6a-ew.a.run.app/api/$version";
      case Flavor.prod:
        return "https://regardless-api-dev-duzwdhkz6a-ew.a.run.app/api/$version";
    }
  }

  String get v1 => 'v1';
  String get v2 => 'v2';

  static void setDebugMode(bool isDebugMode) {
    _flavor = isDebugMode ? Flavor.local : Flavor.dev;
  }

  String get base => _url();
  String get base2 => _url(version: v2);

  String get productImagesBaseUrl => '$base/product_images/';
  String get blogImagesBaseUrl => '$base/blog_images/';
  String get adsBaseUrl => base;
  String get webAddress => (_flavor == Flavor.prod)
      ? "https://app.regardlessmode.com"
      : "http://localhost:50100";
}
