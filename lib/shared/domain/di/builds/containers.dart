import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:riven/modules/builds/presentation/presenters/build_store.dart';
import 'package:riven/modules/favorites_champions/presentation/favorite_champions_store.dart';
import 'package:riven/modules/search/data/repositories/search_history_builds.dart';
import 'package:riven/shared/data/repositories/builds.dart';
import 'package:riven/shared/data/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/datasources/document_db.dart';
import 'package:riven/shared/domain/datasources/local_storage.dart';
import 'package:riven/shared/domain/repositories/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/domain/use_cases/builds/get_builds.dart';
import 'package:riven/shared/domain/use_cases/builds/iget_builds_use_case.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/get_favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iget_favorite_champions_use_case.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iremove_favorite_champion_use_case.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/isave_favorite_champion_use_case.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/remove_favorite_champion.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/save_favorite_champion.dart';
import 'package:riven/shared/external/firebase/firestore.dart';
import 'package:riven/shared/external/get/get_storage.dart';

final routeObserverDIContainer = KiwiContainer()
  ..registerInstance<RouteObserver>(
    (RouteObserver<PageRoute>()),
  );

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

final buildStoreDIContainer = KiwiContainer()
  ..registerFactory<BuildStore>(
    (container) => (BuildStore(
      saveFavoriteChampionUseCase: saveFavoriteChampionsDIContainer(),
      removeFavoriteChampionUseCase: removeFavoriteChampionsDIContainer(),
      getFavoriteChampionsUseCase: getFavoriteChampionsDIContainer(),
    )),
  );

final favoriteChampionsRepoDIContainer = KiwiContainer()
  ..registerFactory<FavoriteChampionsRepository>(
    (container) => FavoriteChampionsRepositoryImpl(
      localStorageDataSourceDIContainer(),
    ),
  );

final localStorageDataSourceDIContainer = KiwiContainer()
  ..registerFactory<LocalStorage>(
    (container) => GetStorageDataSource(),
  );

final getFavoriteChampionsDIContainer = KiwiContainer()
  ..registerFactory<IGetFavoriteChampionsUseCase>(
    (container) => GetFavoriteChampions(
      favoriteChampionsRepoDIContainer(),
    ),
  );

final saveFavoriteChampionsDIContainer = KiwiContainer()
  ..registerFactory<ISaveFavoriteChampionUseCase>(
    (container) => SaveFavoriteChampion(
      favoriteChampionsRepoDIContainer(),
    ),
  );

final removeFavoriteChampionsDIContainer = KiwiContainer()
  ..registerFactory<IRemoveFavoriteChampionUseCase>(
    (container) => RemoveFavoriteChampion(
      favoriteChampionsRepoDIContainer(),
    ),
  );

final favoriteChampionsStoreDIContainer = KiwiContainer()
  ..registerFactory<FavoriteChampionsStore>(
      (container) => FavoriteChampionsStore(
            getFavoriteChampionsDIContainer(),
          ));

final searchChampionHistoryRepositoryDIContainer = KiwiContainer()
  ..registerFactory<SearchHistoryBuildsRepository>(
    (container) => SearchHistoryBuildsImpl(
      localStorageDataSourceDIContainer(),
    ),
  );

final searchChampionHistoryRepositoryWithLocalStorageDIContainer =
    KiwiContainer()
      ..registerFactory<SearchHistoryBuildsWithLocalStorage>(
        (container) => SearchHistoryBuildsImpl(
          GetStorageDataSource('buildSearchHistory'),
        ),
      );
