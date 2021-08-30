import 'package:riven/shared/data/mapper/build.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';

class FavoriteChampionsRepositoryImpl implements FavoriteChampionsRepository {
  final LocalStorage _dataSource;

  FavoriteChampionsRepositoryImpl(this._dataSource);

  @override
  Future<List<Build>> list() async {
    final List builds = await _dataSource.list();
    final List<Build> buildList = [];
    for (var build in builds) {
      buildList.add(
        BuildMapper.fromMap(build),
      );
    }
    return buildList;
  }

  @override
  void remove(String key) {
    _dataSource.remove(key);
  }

  @override
  void save(String key, Build value) {
    _dataSource.save(key, value);
  }

  @override
  Future<Build?> search(String key) async {
    final build = await _dataSource.find(key);
    return BuildMapper.fromMap(build);
  }
}
