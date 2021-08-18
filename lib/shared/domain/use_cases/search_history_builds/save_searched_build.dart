import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/isave_searched_build_use_case.dart';

class SaveSearchedBuild implements ISaveSearchedBuildUseCase {
  final SearchHistoryBuildsRepository repository;

  SaveSearchedBuild(this.repository);

  Future<Either<LocalStorageError, Build>> call(String key, Build value) async {
    final result = await repository.save(key, value);
    return result;
  }
}
