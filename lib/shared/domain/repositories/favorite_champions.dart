import 'package:riven/shared/domain/entities/build.dart';

abstract class FavoriteChampionsRepository {
  Future<List<Build>> list();
  Future<Build> search(String key);
  void remove(String key);
  void save(String key, Build value);
}
