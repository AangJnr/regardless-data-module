enum Flavor { dev, prod }

class Url {
  static bool get isDebug {
    return _flavor == Flavor.dev;
  }

  Url._();

  static Url get shared {
    return Url._();
  }

  static String get web {
    return Url._().webAddress;
  }

  static const Flavor _flavor = Flavor.prod;

  static String _url() {
    return (_flavor == Flavor.prod)
        ? "https://api-duzwdhkz6a-uc.a.run.app/api"
        : "http://127.0.0.1:5050/regardless-social-api/us-central1/api/api";
  }

  get base => _url();
  get productImagesBaseUrl => '$base/product_images/';
  get blogImagesBaseUrl => '$base/blog_images/';
  get adsBaseUrl => '$base';
  get webAddress => (_flavor == Flavor.prod)
      ? "https://app.regardlessmode.com"
      : "http://localhost:61921";
}
