import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  // Define methods to get and set preferences here
  String? getString(String key) {
    String? token = sharedPreferences.getString(key);
    if (token != null && token.isNotEmpty) {
      return token;
    } else {
      return null;
    }
  }

  Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }
}
