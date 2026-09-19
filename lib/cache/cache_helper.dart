//sharedPrefernces as key and  value
//save -get -delete -clear
import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPrefernces; //declare
  static Future<void> cacheInitialization() async {
    sharedPrefernces = await SharedPreferences.getInstance();
    //return obejct fromshardPrefernces class
  }

  //set Datain cache
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      await sharedPrefernces.setInt(key, value);
      return true;
    }
    if (value is String) {
      await sharedPrefernces.setString(key, value);
      return true;
    }
    if (value is bool) {
      await sharedPrefernces.setBool(key, value);
      return true;
    }
    if (value is double) {
      await sharedPrefernces.setDouble(key, value);
      return true;
    }
    return false;
  }

  //get data by key
  static dynamic getData({required String key}) {
    return sharedPrefernces.get(key);
  }

  static void deleteItem({required String key}) {
    sharedPrefernces.remove(key);
  }
}
