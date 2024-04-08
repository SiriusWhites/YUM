class CacheManager {
  static final CacheManager _instance = CacheManager._internal();

  factory CacheManager() {
    return _instance;
  }

  CacheManager._internal();

  final Map<String, dynamic> _cache = {};

  dynamic getFromCache(String key) {
    return _cache[key];
  }

  void putInCache(String key, dynamic value) {
    _cache[key] = value;
  }

  void clearCache() {
    _cache.clear();
  }
}