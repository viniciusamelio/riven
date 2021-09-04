import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';

abstract class IGetSearchedBuildsUseCase {
  final SearchHistoryBuildsWithLocalStorage repository;

  IGetSearchedBuildsUseCase(this.repository);

  Future<Either<DomainException, List<Build>>> call([List<Build> builds]);
}
