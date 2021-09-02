import 'package:mobx/mobx.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iget_favorite_champions_use_case.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iremove_favorite_champion_use_case.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/isave_favorite_champion_use_case.dart';
part 'build_store.g.dart';

class BuildStore = _BuildStoreBase with _$BuildStore;

abstract class _BuildStoreBase with Store {
  _BuildStoreBase({
    required this.saveFavoriteChampionUseCase,
    required this.removeFavoriteChampionUseCase,
    required this.getFavoriteChampionsUseCase,
  });

  final ISaveFavoriteChampionUseCase saveFavoriteChampionUseCase;
  final IRemoveFavoriteChampionUseCase removeFavoriteChampionUseCase;
  final IGetFavoriteChampionsUseCase getFavoriteChampionsUseCase;

  @observable
  bool isFavorite = false;
}
