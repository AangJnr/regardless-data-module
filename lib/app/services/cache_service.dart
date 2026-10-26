import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

import '../app.logger.dart';

class CacheServiceImpl implements CacheService {
  final Map<String, AsyncMemoizer> _memoizerMap = {};
  final Duration cacheExpirationDuration = const Duration(hours: 24);
  DateTime? _lastFetchTime;

  @override
  Future<T> execute<T>(
    FutureOr<T> Function() apiCall,
    String key, {
    bool refresh = false,
  }) async {
    final memoizer = _getMemoizer<T>(key, refresh);

    clearCacheIfNeeded();
    final stopwatch = Stopwatch()..start();

    final data = await memoizer.runOnce(apiCall);
    final callTime = stopwatch.elapsed;

    if (data == null) {
      //failed due to a networ error or other reason
      //for refresh == true, we do not immediately clear the cache until we are certain that
      //data was returned from the server then we simply replace existing data
      //If network failed, we return the old data rather than showing empty results
      //to improve user UX
      //But also note that app restarts cleans the cache completely
      if (refresh && _memoizerMap.containsKey(key)) {
        return await _getMemoizer<T>(key).runOnce(apiCall);
      }
      return throw Exception('API call returned null, expected type: $T');
    }
    getLogger("CacheServiceImpl").e(
      "memoizer hasRun ${memoizer.hasRun} || time Elapsed was : ${callTime.inMilliseconds} ms",
    );
    _lastFetchTime = DateTime.now(); // Update last fetch time

    _memoizerMap[key] = memoizer;
    return data;
  }

  AsyncMemoizer<T> _getMemoizer<T>(String key, [bool refresh = false]) {
    if (!refresh && _memoizerMap.containsKey(key)) {
      getLogger("CacheServiceImpl").e("getMemoizer has key $key.");
      return _memoizerMap[key] as AsyncMemoizer<T>;
    }
    getLogger("CacheServiceImpl").e(
      "getMemoizer has no key $key or isRefreshing? = $refresh. New memoizer created.",
    );
    return AsyncMemoizer<T>();
  }

  void clearCacheIfNeeded() {
    if ((_lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) > cacheExpirationDuration)) {
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

  @override
  void invalidate() {
    _memoizerMap.clear();
    _lastFetchTime = null;
    debugPrint("CacheServiceImpl - Cache invalidated");
  }
}

abstract class CacheService {
  Future<T> execute<T>(
    FutureOr<T> Function() apiCall,
    String key, {
    bool refresh = false,
  });

  void clear(String s);
  void invalidate();
}
