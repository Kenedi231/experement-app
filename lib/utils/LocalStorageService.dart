import 'package:localstorage/localstorage.dart';
import 'package:myapp/constants/constants.dart';

class LocalStorageService {
  static LocalStorage storage;

  static void init() { 
    storage = new LocalStorage(StorageName);
  }

  static dynamic getItem(String key) => storage.getItem(key);

  static void setItem(String key, dynamic value) => storage.setItem(key, value);

  static void clearStorage() => storage.clear();
}