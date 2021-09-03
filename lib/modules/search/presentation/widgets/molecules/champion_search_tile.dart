import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:riven/modules/search/presentation/widgets/params/champion_search_tile.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class ChampionSearchTile extends StatelessWidget {
  const ChampionSearchTile({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ChampionSearchTileParams data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: fromCssColor('#242631').withOpacity(0.8),
      leading: Container(
        width: 40,
        child: Portrait(
          data: PortraitParams(
            imageUrl: data.portraitUrl,
            size: 40,
          ),
        ),
      ),
      title: Text(
        data.championName,
        style: assetLabelTextStyle(
          color: Colors.white.withAlpha(200),
        ),
      ),
      subtitle: Text(
        data.championRole,
        style: assetLabelTextStyle(),
      ),
    );
  }
}
