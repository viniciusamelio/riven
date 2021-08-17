import 'package:mobx/mobx.dart';
part 'build_store.g.dart';

class BuildStore = _BuildStoreBase with _$BuildStore;

abstract class _BuildStoreBase with Store {
  @observable
  int pageIndex = 1;
}
