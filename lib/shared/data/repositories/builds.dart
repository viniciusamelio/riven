import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riven/shared/data/mapper/build.dart';
import 'package:riven/shared/domain/datasources/document_db.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/champion_build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';
import 'package:riven/shared/domain/repositories/build.dart';

class BuildRepositoryImpl implements BuildRepository {
  final DocumentDBDatasource _datasource;

  BuildRepositoryImpl(this._datasource);

  @override
  Future<Either<DomainException, List<Build>>> list() async {
    final List<QueryDocumentSnapshot<Object?>> documents =
        await _datasource.getAllDocuments();
    if (documents.length < 0) {
      return Left(
        ChampionBuildError(message: 'Nenhuma build foi encontrada'),
      );
    }

    final List<Build> builds = [];
    for (var document in documents) {
      builds.add(
        BuildMapper.fromMap(document.data()),
      );
    }
    return Right(builds);
  }
}
