import 'package:riven/shared/domain/entities/build.dart';

abstract class FavoriteChampionsRepository {
  Future<List<Build>> list();
  void remove(String key);
  void save(Build value);
}
