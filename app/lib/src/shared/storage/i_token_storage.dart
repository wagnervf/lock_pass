abstract class TokenStorageInterface {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}