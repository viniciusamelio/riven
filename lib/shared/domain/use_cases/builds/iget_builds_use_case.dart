import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';
import 'package:riven/shared/domain/repositories/build.dart';

abstract class IGetBuildsUseCase {
  IGetBuildsUseCase(this.repository);
  final BuildRepository repository;
  Future<Either<DomainException, List<Build>>> call();
}
