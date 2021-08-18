import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/iremove_searched_builds_use_case.dart';

class RemoveSearchedBuildsUseCase implements IRemoveSearchedBuildsUseCase {
  final SearchHistoryBuildsRepository repository;

  RemoveSearchedBuildsUseCase(this.repository);

  Future<Either<LocalStorageError, String>> call() async {
    final result = await repository.remove();
    return result;
  }
}
