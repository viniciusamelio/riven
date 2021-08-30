import 'package:get_storage/get_storage.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';

class GetStorageDataSource implements LocalStorage {
  final box = GetStorage();

  Type? find(String key) {
    return box.read<Type?>(key);
  }

  List<Type?> list() {
    return box.getValues();
  }

  remove(String key) {
    box.remove(key);
  }

  save(String key, value) {
    box.write(key, value);
  }
}
