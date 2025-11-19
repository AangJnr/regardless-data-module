import 'dart:io';

enum Flavor { local, dev, prod }

class Url {
  static bool get isDebug {
    return _flavor == Flavor.local;
  }

  static String get firebaseEmulatorHost {
    return Platform.isAndroid
        ? '10.225.188.182' //'10.0.2.2'
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

  static String _url() {
    switch (_flavor) {
      case Flavor.local:
        return "http://$firebaseEmulatorHost:8080/api/v1";
      case Flavor.dev:
        return "https://regardless-api-service-dev-duzwdhkz6a-uc.a.run.app/api/v1";
      case Flavor.prod:
        return "https://regardless-api-service-dev-duzwdhkz6a-uc.a.run.app/api/v1";
    }
  }

  static void setDebugMode(bool isDebugMode) {
    _flavor = isDebugMode ? Flavor.local : Flavor.dev;
  }

  String get base => _url();
  String get productImagesBaseUrl => '$base/product_images/';
  String get blogImagesBaseUrl => '$base/blog_images/';
  String get adsBaseUrl => base;
  String get webAddress => (_flavor == Flavor.prod)
      ? "https://app.regardlessmode.com"
      : "http://localhost:61921";
}
