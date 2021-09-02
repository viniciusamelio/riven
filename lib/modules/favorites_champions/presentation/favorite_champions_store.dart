import 'package:mobx/mobx.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iget_favorite_champions_use_case.dart';
part 'favorite_champions_store.g.dart';

class FavoriteChampionsStore = _FavoriteChampionsStoreBase
    with _$FavoriteChampionsStore;

abstract class _FavoriteChampionsStoreBase with Store {
  final IGetFavoriteChampionsUseCase _getFavoriteChampionsUseCase;

  _FavoriteChampionsStoreBase(this._getFavoriteChampionsUseCase) {
    getFavoriteChampionsStore();
  }

  @observable
  ObservableFuture<List>? listFavoriteChampionsStoreObservable;

  @computed
  FutureStatus? get listFavoriteChampionsStatus =>
      listFavoriteChampionsStoreObservable?.status;

  @action
  getFavoriteChampionsStore() {
    listFavoriteChampionsStoreObservable =
        _getFavoriteChampionsUseCase().asObservable();
  }
}
