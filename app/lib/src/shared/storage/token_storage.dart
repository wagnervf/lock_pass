import 'package:lockpass/src/shared/storage/i_token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage implements TokenStorageInterface{
  
  static const String TOKEN_KEY = 'token';

   Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN_KEY);
  }

   Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(TOKEN_KEY, token);
  }

   Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(TOKEN_KEY);
  }
}