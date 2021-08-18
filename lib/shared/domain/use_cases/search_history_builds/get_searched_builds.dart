import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/iget_searched_builds_use_case.dart';

class GetSearchedBuilds implements IGetSearchedBuildsUseCase {
  final SearchHistoryBuildsRepository repository;

  GetSearchedBuilds(this.repository);

  Future<Either<LocalStorageError, List<Build>>> call() async {
    final result = await repository.list();
    return result;
  }
}
