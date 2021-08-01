import 'package:kiwi/kiwi.dart';
import 'package:riven/shared/data/repositories/builds.dart';
import 'package:riven/shared/domain/datasources/document_db.dart';
import 'package:riven/shared/domain/repositories/build.dart';
import 'package:riven/shared/domain/use_cases/get_builds.dart';
import 'package:riven/shared/domain/use_cases/iget_builds_use_case.dart';
import 'package:riven/shared/external/firebase/firestore.dart';

final getBuildsDIContainer = KiwiContainer()
  ..registerFactory<IGetBuildsUseCase>(
    (container) => GetBuilds(
      container.resolve(),
    ),
  )
  ..registerFactory<BuildRepository>(
    (container) => BuildRepositoryImpl(
      container.resolve(),
    ),
  )
  ..registerFactory<DocumentDBDatasource>(
    (container) => FirestoreDatasource(collectionName: 'builds'),
  );
