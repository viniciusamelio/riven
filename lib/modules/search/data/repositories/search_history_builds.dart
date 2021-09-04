import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/utils/getBuildFromIterable.dart';

class SearchHistoryBuildsImpl implements SearchHistoryBuildsWithLocalStorage {
  final LocalStorage _dataSource;

  SearchHistoryBuildsImpl(this._dataSource);
  @override
  Future<Either<LocalStorageError, List<Build>>> list(
      {List<Build> builds = const []}) async {
    late final result;
    try {
      final Iterable<String> searchedBuilds = await _dataSource.list();
      final buildList = getBuildFromIterable(searchedBuilds, builds);
      result = right(buildList);
    } catch (e) {
      result = left(LocalStorageError(
          message: "Achamos um erro ao procurar seu histórico"));
    }
    return result;
  }

  @override
  Future<Either<LocalStorageError, String>> remove() async {
    late final result;
    try {
      await _dataSource.remove('');
      result = right('Histórico limpo com sucesso!');
    } catch (e) {
      result = left(
        LocalStorageError(message: 'Achamos um erro ao limpar seu histórico'),
      );
    }

    return result;
  }

  @override
  Future<Either<LocalStorageError, Build>> save(String key, Build value) async {
    late final result;
    try {
      await _dataSource.save(key, value);
      result = right(value);
    } catch (e) {
      result = left(
        LocalStorageError(
            message: 'Achamos um erro ao salvar essa build ao histórico'),
      );
    }
    return result;
  }
}
