import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';
import 'package:riven/shared/domain/repositories/build.dart';
import 'package:riven/shared/domain/use_cases/builds/iget_builds_use_case.dart';

class GetBuilds implements IGetBuildsUseCase {
  final BuildRepository repository;

  GetBuilds(this.repository);

  @override
  Future<Either<DomainException, List<Build>>> call() async {
    final result = await repository.list();
    return result;
  }
}
