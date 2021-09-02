import 'package:riven/shared/data/mapper/build.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';

class FavoriteChampionsRepositoryImpl implements FavoriteChampionsRepository {
  final LocalStorage _dataSource;

  FavoriteChampionsRepositoryImpl(this._dataSource);

  @override
  Future<List> list() async {
    final Iterable championNames = await _dataSource.list();
    return championNames.toList();
  }

  @override
  void remove(String key) {
    _dataSource.remove(key);
  }

  @override
  void save(String key) {
    _dataSource.save(key, key);
  }

  @override
  Future<Build?> search(String key) async {
    final build = await _dataSource.find(key);
    return BuildMapper.fromMap(build);
  }
}
