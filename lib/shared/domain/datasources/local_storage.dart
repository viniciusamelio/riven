abstract class LocalStorage {
  dynamic find(String key);
  dynamic save(String key, dynamic value);
  dynamic remove(String key);
  dynamic list();
}
