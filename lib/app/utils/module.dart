class AppModule {
  static AppModule? _instance;
  AppModule._();

  /// access to the Singleton instance of GetIt
  static AppModule get instance {
    // ignore: join_return_with_assignment
    _instance ??= AppModule._();

    return _instance!;
  }
}
