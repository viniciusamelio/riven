import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:riven/modules/search/presentation/widgets/molecules/champion_search_tile.dart';
import 'package:riven/modules/search/presentation/widgets/params/champion_search_field.dart';
import 'package:riven/modules/search/presentation/widgets/params/champion_search_tile.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';

class ChampionSearchField extends StatelessWidget {
  const ChampionSearchField({Key? key, required this.data}) : super(key: key);
  final ChampionSearchFieldParams data;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
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
        return data.builds.where(
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
        return ChampionSearchTile(
          data: ChampionSearchTileParams(
              portraitUrl: suggestion.champion!.portraitUrl,
              championName: suggestion.champion!.name,
              championRole: suggestion.champion!.role),
        );
      },
      onSuggestionSelected: (Build suggestion) {
        print(suggestion.champion!.name);
      },
    );
  }
}
