import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

import '../app.logger.dart';

class CacheServiceImpl implements CacheService {
  final Map<String, AsyncMemoizer> _memoizerMap = {};
  final Duration cacheExpirationDuration = const Duration(hours: 24);
  DateTime? _lastFetchTime;

  @override
  Future<T> execute<T>(FutureOr<T> Function() apiCall, String key) async {
    final memoizer = _getMemoizer<T>(key);

    clearCacheIfNeeded();
    final stopwatch = Stopwatch()..start();

    final data = await memoizer.runOnce(apiCall);
    final callTime = stopwatch.elapsed;

    if (data == null) {
      throw Exception('API call returned null, expected type: $T');
    }
    getLogger("CacheServiceImpl").e(
        "memoizer hasRun ${memoizer.hasRun} || time Elapsed was : ${callTime.inMilliseconds} ms");
    _lastFetchTime = DateTime.now(); // Update last fetch time

    _memoizerMap[key] = memoizer;
    return data;
  }

  AsyncMemoizer<T> _getMemoizer<T>(String key) {
    if (_memoizerMap.containsKey(key)) {
      getLogger("CacheServiceImpl").e("getMemoizer has key.");
      return _memoizerMap[key] as AsyncMemoizer<T>;
    }
    getLogger("CacheServiceImpl")
        .e("getMemoizer no key. New memoizer created.");
    return AsyncMemoizer<T>();
  }

  void clearCacheIfNeeded() {
    if (_lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) > cacheExpirationDuration) {
      _memoizerMap.clear(); // Clear the cache
      _lastFetchTime = null; // Reset last fetch time
      debugPrint("CacheServiceImpl - Cache cleared");
    }
  }

  @override
  void clear(String key) {
    _memoizerMap.remove(key);
    debugPrint("CacheServiceImpl - Cache cleared for $key");
  }
}

abstract class CacheService {
  Future<T> execute<T>(FutureOr<T> Function() apiCall, String key);

  void clear(String s);
}
