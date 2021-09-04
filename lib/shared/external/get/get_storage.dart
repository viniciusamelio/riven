import 'package:get_storage/get_storage.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';

class GetStorageDataSource implements LocalStorageWithClearOption {
  final box = GetStorage();
  final String container;

  GetStorageDataSource([this.container = 'GetStorage']);

  find(String key) {
    return box.read<Type?>(key);
  }

  list() {
    final values = box.getValues();
    return values;
  }

  remove([String key = ""]) {
    if (key.isNotEmpty) {
      box.remove(key);
      return;
    }

    box.erase();
  }

  save(String key, value) {
    Iterable a = box.getValues();
    if (!a.contains(key)) {
      box.write(key, value);
    }
  }
}
