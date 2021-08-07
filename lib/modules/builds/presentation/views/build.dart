import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/stat_block.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/stat_block.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/skill.dart';
import 'package:riven/shared/domain/entities/summoner_spell.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/padding.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class BuildScreen extends StatefulWidget {
  const BuildScreen({Key? key}) : super(key: key);

  @override
  _BuildViewState createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildScreen> {
  late final Build _build;
  var decimalFormatter = NumberFormat.decimalPattern('pt-BR');

  @override
  void didChangeDependencies() {
    _build = ModalRoute.of(context)!.settings.arguments as Build;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _build.champion!.name,
                      style: headerOneStyle(),
                    ),
                    Text(
                      _build.champion!.role,
                      style: headerThreeStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${decimalFormatter.format(_build.champion!.gamesAnalyzed)} Games Analisados",
                      style: defaultTextStyle(),
                    ),
                  ],
                ),
                Portrait(
                  data: PortraitParams(
                    accentColor: primaryGreen,
                    imageUrl: _build.champion!.portraitUrl,
                    size: 70,
                    borderWidth: 3,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                  value: decimalFormatter.format(_build.champion!.banrate),
                  valueColor: red,
                )),
                StatBlock(
                  data: StatBlockParams(
                    label: 'Taxa de pick',
                    value: decimalFormatter.format(_build.champion!.pickrate),
                    valueColor: blue,
                  ),
                ),
                StatBlock(
                  data: StatBlockParams(
                    label: 'Taxa de vitória',
                    value: decimalFormatter.format(_build.champion!.winrate),
                    valueColor: golden,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SectionTitle(
              data: SectionTitleParams(
                title: 'Feitiços de invocador',
              ),
            ),
            const SizedBox(height: 5),
            _spells(_build.spells!),
            const SizedBox(
              height: 20,
            ),
            SectionTitle(
              data: SectionTitleParams(
                title: 'Ordem das habilidades',
              ),
            ),
            const SizedBox(height: 5),
            _skills(_build.skillPriority!),
          ],
        ),
      ),
    );
  }

  Row _skills(List<Skill> skills) {
    List<Widget> children = [];
    for (var skill in skills) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GameAssetImage(
            data: GameAssetImageParams(
              imageUrl: skill.imageUrl,
              label: skill.key,
            ),
          ),
        ),
      );

      if (skill != skills[skills.length - 1]) {
        children.add(
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.arrow_forward_ios,
              color: greyTextColor,
            ),
          ),
        );
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Row _spells(List<SummonerSpell> spells) {
    List<Widget> children = [];

    for (var spell in spells) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GameAssetImage(
            data: GameAssetImageParams(
              imageUrl: spell.imageUrl,
              label: spell.name,
            ),
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
