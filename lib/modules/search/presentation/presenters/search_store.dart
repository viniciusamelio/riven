import 'package:mobx/mobx.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/iget_searched_builds_use_case.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/iremove_searched_builds_use_case.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/isave_searched_build_use_case.dart';
part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final IGetSearchedBuildsUseCase _getSearchedBuilds;
  final ISaveSearchedBuildUseCase _saveSearchedBuild;
  final IRemoveSearchedBuildsUseCase _removeSearchedBuilds;

  _SearchStoreBase(
    this._getSearchedBuilds,
    this._saveSearchedBuild,
    this._removeSearchedBuilds,
  );
}
