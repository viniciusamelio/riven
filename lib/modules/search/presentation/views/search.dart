import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  late List<Build> _builds;

  @override
  void initState() {
    _builds = Provider.of<BuildSet>(context, listen: false).builds;
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
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                cursorColor: primaryGreen,
                decoration: InputDecoration(
                    labelText: 'Nome do campeão',
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 12,
                    )),
              ),
              suggestionsCallback: (pattern) {
                return _builds.where(
                  (element) => element.champion!.name.contains(pattern),
                );
              },
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                color: fromCssColor('#242631'),
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
              ),
              noItemsFoundBuilder: (context) {
                return ListTile(
                  title: Text(
                    'Campeão não encontrado',
                    style: assetLabelTextStyle(
                      color: red,
                    ),
                  ),
                );
              },
              itemBuilder: (context, Build suggestion) {
                return ListTile(
                  tileColor: fromCssColor('#242631').withOpacity(0.8),
                  leading: Container(
                    width: 40,
                    child: Portrait(
                      data: PortraitParams(
                        imageUrl: suggestion.champion!.portraitUrl,
                        size: 40,
                      ),
                    ),
                  ),
                  title: Text(
                    suggestion.champion!.name,
                    style: assetLabelTextStyle(
                      color: Colors.white.withAlpha(200),
                    ),
                  ),
                  subtitle: Text(
                    suggestion.champion!.role,
                    style: assetLabelTextStyle(),
                  ),
                );
              },
              onSuggestionSelected: (suggestion) {
                print('suggestion selected');
              },
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
