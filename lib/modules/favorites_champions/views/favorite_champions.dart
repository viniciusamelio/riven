import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:riven/modules/favorites_champions/presentation/favorite_champions_store.dart';
import 'package:riven/shared/domain/di/builds/containers.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/padding.dart';

class FavoriteChampionsScreen extends StatefulWidget {
  const FavoriteChampionsScreen({Key? key}) : super(key: key);

  @override
  _FavoriteChampionsScreenState createState() =>
      _FavoriteChampionsScreenState();
}

class _FavoriteChampionsScreenState extends State<FavoriteChampionsScreen> {
  late FavoriteChampionsStore _store;
  late ReactionDisposer _listFavoriteChampionsReaction;
  @override
  void initState() {
    _store = FavoriteChampionsStore(
      getFavoriteChampionsDIContainer(),
    );

    _listFavoriteChampionsReaction =
        reaction((_) => _store.listFavoriteChampionsStatus, (_) {
      print(_store.listFavoriteChampionsStoreObservable?.value);
    });
    super.initState();
  }

  @override
  void dispose() {
    _listFavoriteChampionsReaction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Favoritos <3",
                style: GoogleFonts.inter(
                  color: primaryGreen,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
