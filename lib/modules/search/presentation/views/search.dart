import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/search/presentation/presenters/search_store.dart';
import 'package:riven/modules/search/presentation/widgets/organisms/champion_search_field.dart';
import 'package:riven/modules/search/presentation/widgets/params/champion_search_field.dart';
import 'package:riven/shared/domain/di/builds/containers.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/presentation/styles/color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  late List<Build> _builds;
  late final SearchStore _searchStore;
  @override
  void initState() {
    _builds = Provider.of<BuildSet>(context, listen: false).builds;
    _searchStore = searchStoreDIContainer();
    super.initState();
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
