import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/search/presentation/presenters/search_store.dart';
import 'package:riven/modules/search/presentation/widgets/organisms/champion_search_field.dart';
import 'package:riven/modules/search/presentation/widgets/params/champion_search_field.dart';
import 'package:riven/shared/domain/di/builds/containers.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  late List<Build> _builds;
  late final SearchStore _searchStore;
  late ReactionDisposer _loadSearchedBuildsReaction;
  @override
  void initState() {
    _builds = Provider.of<BuildSet>(context, listen: false).builds;
    _searchStore = searchStoreDIContainer();
    _searchStore.getSearchedBuilds(_builds);

    _loadSearchedBuildsReaction =
        reaction((_) => _searchStore.getSearchedBuildsStatus, (_) {
      final value = _searchStore.getSearchedBuildsRequest.value;
      if (value != null) {
        value.fold((exception) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Opa!',
            desc: exception.message,
            btnOkText: 'Tentar novamente',
            btnOkOnPress: () => _searchStore.getSearchedBuilds(_builds),
          )..show();
        }, (r) {
          _searchStore.searchedBuilds.clear();
          _searchStore.searchedBuilds.addAll(r);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _loadSearchedBuildsReaction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Riven",
              style: GoogleFonts.inter(
                color: primaryGreen,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ChampionSearchField(
              data: ChampionSearchFieldParams(
                builds: _builds,
              ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) => Visibility(
                visible: _searchStore.searchedBuilds.length > 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Últimas pesquisas",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: greyTextColor,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () => print("Remover pesquisas do storage"),
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.delete,
                              color: red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: _searchStore.searchedBuilds.length,
                          itemBuilder: (context, index) {
                            final build = _searchStore.searchedBuilds[index];
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Portrait(
                                data: PortraitParams(
                                  imageUrl: build.champion!.portraitUrl,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
