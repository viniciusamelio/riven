import 'package:get_storage/get_storage.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';

class GetStorageDataSource implements LocalStorageWithClearOption {
  late final GetStorage box;
  final String container;

  GetStorageDataSource([this.container = 'GetStorage']) {
    box = GetStorage(container);
  }

  find(String key) {
    return box.read<Type?>(key);
  }

  list() {
    final values = box.getValues();
    return values;
  }

  remove([String key = ""]) {
    box.remove(key);
  }

  save(String key, value) async {
    Iterable a = box.getValues();
    if (!a.contains(value)) {
      await box.write(key, value);
    }
  }
}
