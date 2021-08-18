import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';

abstract class IRemoveSearchedBuildsUseCase {
  final SearchHistoryBuildsRepository repository;

  IRemoveSearchedBuildsUseCase(this.repository);

  Future<Either<LocalStorageError, void>> call();
}
