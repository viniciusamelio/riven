abstract class LocalStorage {
  dynamic find(String key);
  dynamic save(String key, dynamic value);
  dynamic remove(String key);
  dynamic list();
}

abstract class LocalStorageWithClearOption extends LocalStorage {
  @override
  dynamic remove([String key]);
}
