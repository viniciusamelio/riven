import 'package:mobx/mobx.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
part 'builds_store.g.dart';

class BuildsStore = _BuildsStoreBase with _$BuildsStore;

abstract class _BuildsStoreBase with Store {
  BuildSet? buildSet;
}
