import 'package:foodninja/core/network/api_error_handler.dart';

class CachedKeys {
  static String restaurantsData = "restaurants_Data";
  static String foodData = "food_Data";
  static String favoriteData = "favorite_Data";
  static Map<String, int> expirationCacheTime = {
    "restaurants_Data": 6000000,
    "food_Data": 6000000,
    "favorite_Data":3600000
  };
}

class CachedApp {
  Map<String, CachedItem> cachedData = {};
  void saveData(dynamic data, String key) {
    cachedData[key] = CachedItem(data);
  }

  void clearCache() {
    cachedData.clear();
  }

  void removeFromCache(String key) {
    cachedData.remove(key);
  }

  dynamic getCachedData(String key) {
    CachedItem? cachedItem = cachedData[key];
    if (cachedItem != null &&
        cachedItem.isValid(CachedKeys.expirationCacheTime[key]!)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }
}

class CachedItem {
  dynamic data;
  int cachedTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int timeInMillisecond) =>
      DateTime.now().millisecondsSinceEpoch - cachedTime < timeInMillisecond;
}
