import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';

abstract class ISaveSearchedBuildUseCase {
  final SearchHistoryBuildsRepository repository;

  ISaveSearchedBuildUseCase(this.repository);

  Future<Either<DomainException, Build>> call(String key, Build value);
}
