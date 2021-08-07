import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/shared/presentation/styles/text.dart';

class GameAssetImage extends StatelessWidget {
  final GameAssetImageParams data;

  const GameAssetImage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: data.size ?? 43,
          width: data.size ?? 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: data.borderColor ?? Colors.transparent,
              width: 3,
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                data.imageUrl,
              ),
            ),
          ),
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: 65,
          ),
          child: Text(
            data.label,
            style: assetLabelTextStyle(
              color: Colors.white,
              weight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
