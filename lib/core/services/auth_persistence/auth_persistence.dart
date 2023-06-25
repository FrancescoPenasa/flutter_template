abstract class AuthPersistence {
  Future<void> setJwt(String jwt);
  Future<String> getJwt();
  Future<void> rmJwt();
  Future<void> reset();
}
