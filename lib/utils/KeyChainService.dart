import 'package:flutter_keychain/flutter_keychain.dart';

class KeyChainService {

  static Future<dynamic> getValue(key) async {
    dynamic value = await FlutterKeychain.get(key: key);
    return value;
  }

  static void setItem(key, value) async => await FlutterKeychain.put(key: key, value: value);
  
  static void deleteItem(key) async => await FlutterKeychain.remove(key: key);

  static void clearKeyChain() async => await FlutterKeychain.clear();
}