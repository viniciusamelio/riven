import 'package:riven/shared/domain/entities/build.dart';

abstract class SearchHistoryBuildsRepository {
  Future<List<Build>> list();
  void remove();
  void save(String key, Build value);
}
