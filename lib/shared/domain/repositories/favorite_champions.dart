import 'package:riven/shared/domain/entities/build.dart';

abstract class FavoriteChampionsRepository {
  list();
  void remove(String key);
  void save(String key, Build value);
}
