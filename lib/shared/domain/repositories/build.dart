import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';

abstract class BuildRepository {
  Future<Either<DomainException, List<Build>>> list();
}
