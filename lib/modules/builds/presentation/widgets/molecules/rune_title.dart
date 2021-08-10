import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/params/rune_title.dart';
import 'package:riven/shared/presentation/styles/color.dart';

import 'game_asset_image.dart';

class RuneTitle extends StatelessWidget {
  final RuneTitleParams data;
  const RuneTitle({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(data.padding ?? 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: spotlightDark.withAlpha(75),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GameAssetImage(
            data: GameAssetImageParams(
              imageUrl: data.imageUrl,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            data.label,
          )
        ],
      ),
    );
  }
}
