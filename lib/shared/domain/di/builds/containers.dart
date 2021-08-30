import 'package:kiwi/kiwi.dart';
import 'package:riven/shared/data/repositories/builds.dart';
import 'package:riven/shared/data/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/datasources/document_db.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';
import 'package:riven/shared/domain/repositories/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/builds/get_builds.dart';
import 'package:riven/shared/domain/use_cases/builds/iget_builds_use_case.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/get_favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iget_favorite_champions_use_case.dart';
import 'package:riven/shared/external/firebase/firestore.dart';
import 'package:riven/shared/external/get/get_storage.dart';

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

final getFavoriteChampionsDIContainer = KiwiContainer()
  ..registerFactory<IGetFavoriteChampionsUseCase>(
    (container) => GetFavoriteChampions(
      container.resolve(),
    ),
  )
  ..registerFactory<FavoriteChampionsRepository>(
    (container) => FavoriteChampionsRepositoryImpl(
      container.resolve(),
    ),
  )
  ..registerFactory<LocalStorage>(
    (container) => GetStorageDataSource(),
  );
