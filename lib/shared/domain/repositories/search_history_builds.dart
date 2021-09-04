import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';

abstract class SearchHistoryBuildsRepository {
  Future<Either<LocalStorageError, List<Build>>> list();
  Future<Either<LocalStorageError, String>> remove();
  Future<Either<LocalStorageError, Build>> save(String key, Build value);
}

abstract class SearchHistoryBuildsWithLocalStorage
    extends SearchHistoryBuildsRepository {
  @override
  Future<Either<LocalStorageError, List<Build>>> list({List<Build> builds});
}
