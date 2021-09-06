import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:riven/modules/favorites_champions/presentation/favorite_champions_store.dart';
import 'package:riven/modules/favorites_champions/widgets/molecules/empty_state.dart';
import 'package:riven/shared/domain/di/builds/containers.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/padding.dart';
import 'package:riven/shared/presentation/widgets/organisms/portrait_grid.dart';
import 'package:riven/shared/presentation/widgets/params/portrait_grid.dart';

class FavoriteChampionsScreen extends StatefulWidget {
  const FavoriteChampionsScreen({Key? key}) : super(key: key);

  @override
  _FavoriteChampionsScreenState createState() =>
      _FavoriteChampionsScreenState();
}

class _FavoriteChampionsScreenState extends State<FavoriteChampionsScreen>
    with RouteAware {
  late FavoriteChampionsStore _store;
  late ReactionDisposer _listFavoriteChampionsReaction;
  late RouteObserver routeObserver;

  @override
  void initState() {
    _store = favoriteChampionsStoreDIContainer();

    _listFavoriteChampionsReaction =
        reaction((_) => _store.listFavoriteChampionsStatus, (_) {
      _store.favoriteChampions.clear();
      List<Build>? favoriteSavedChampions =
          _store.listFavoriteChampionsStoreObservable?.value;
      if (favoriteSavedChampions != null)
        _store.favoriteChampions.addAll(favoriteSavedChampions);
    });

    super.initState();
  }

  @override
  void dispose() {
    _listFavoriteChampionsReaction();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _store.getFavoriteChampions();
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    routeObserver = routeObserverDIContainer();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Observer(builder: (_) {
        if (_store.favoriteChampions.isEmpty)
          return FavoriteChampionsEmptyStateScreen();
        return SingleChildScrollView(
          padding: screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "Favoritos <3",
                  style: GoogleFonts.inter(
                    color: purple,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) {
                  if (_store.listFavoriteChampionsStatus ==
                      FutureStatus.pending) {
                    return CircularProgressIndicator();
                  }
                  return PortraitsGrid(
                    data: PortraitGridParams(
                      _store.favoriteChampions,
                      portraitsSize: MediaQuery.of(context).size.width / 9,
                      routeName: '/build',
                      accentColor: purple,
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
