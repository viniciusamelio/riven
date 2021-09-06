import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:riven/modules/builds/presentation/presenters/build_store.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/favorite_indicator.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/stat_block.dart';
import 'package:riven/modules/builds/presentation/widgets/params/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/params/favorite_indicator.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/stat_block.dart';
import 'package:riven/shared/domain/di/builds/containers.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class BuildHeader extends StatefulWidget {
  final BuildHeaderParams data;
  BuildHeader({Key? key, required this.data}) : super(key: key);

  @override
  _BuildHeaderState createState() => _BuildHeaderState();
}

class _BuildHeaderState extends State<BuildHeader> {
  final decimalFormatter = NumberFormat.decimalPattern('pt-BR');

  late BuildStore _buildStore;

  @override
  void initState() {
    _buildStore = buildStoreDIContainer();
    _checkIfIsFavorite();
    super.initState();
  }

  void _checkIfIsFavorite() async {
    final favoritesChampions = await _buildStore.getFavoriteChampionsUseCase();
    _buildStore.isFavorite = favoritesChampions
            .where(
              (element) =>
                  element.champion!.name == widget.data.build.champion!.name,
            )
            .isNotEmpty
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.championStats.name,
                  style: headerOneStyle(),
                ),
                Text(
                  widget.data.championStats.role,
                  style: headerThreeStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${decimalFormatter.format(widget.data.championStats.gamesAnalyzed)} Games Analisados",
                  style: defaultTextStyle(),
                ),
              ],
            ),
            Container(
              height: 85,
              child: Stack(
                children: [
                  Portrait(
                    data: PortraitParams(
                      accentColor: primaryGreen,
                      imageUrl: widget.data.championStats.portraitUrl,
                      size: 70,
                      borderWidth: 3,
                    ),
                  ),
                  Positioned(
                    right: 36,
                    bottom: 0,
                    child: Observer(
                      builder: (_) => FavoriteIndicator(
                        data: FavoriteIndicatorParams(
                          isFavorite: _buildStore.isFavorite,
                          setFavoriteFunction: () =>
                              _buildStore.saveFavoriteChampionUseCase(
                            widget.data.championStats.name,
                            widget.data.build,
                          ),
                          unsetFavoriteFunction: () =>
                              _buildStore.removeFavoriteChampionUseCase(
                                  widget.data.championStats.name),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        SectionTitle(
          data: SectionTitleParams(
            title: 'Estatísticas',
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StatBlock(
                data: StatBlockParams(
              label: 'Taxa de ban',
              value: decimalFormatter.format(widget.data.championStats.banrate),
              valueColor: red,
            )),
            StatBlock(
              data: StatBlockParams(
                label: 'Taxa de pick',
                value:
                    decimalFormatter.format(widget.data.championStats.pickrate),
                valueColor: blue,
              ),
            ),
            StatBlock(
              data: StatBlockParams(
                label: 'Taxa de vitória',
                value:
                    decimalFormatter.format(widget.data.championStats.winrate),
                valueColor: golden,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
