import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/stat_block.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/endgame_items_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/runes_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/skill_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/spell_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/starting_items_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/params/endgame_items_secion.dart';
import 'package:riven/modules/builds/presentation/widgets/params/runes_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/skill_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/spell_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/starting_items_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/stat_block.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/padding.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: 0,
        onTap: (i) => setState(
          () {},
        ),
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        unselectedItemColor: greyTextColor,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.book),
            title: Text("Build"),
            selectedColor: primaryGreen,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.timeline),
            title: Text("Counters"),
            selectedColor: purple,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BuildHeader(
              data: BuildHeaderParams(
                championStats: _build.champion!,
              ),
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
            SpellSection(
              data: SpellSectionParams(
                spells: _build.spells!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RunesSection(
              data: RunesSectionParams(
                runes: _build.runes!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SkillSection(
              data: SkillSectionParams(
                skills: _build.skillPriority!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StartingItemsSection(
              data: StartingItemsSectionParams(
                items: _build.earlyItems!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            EndgameItemsSection(
              data: EndgameItemsSectionParams(
                items: _build.items!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
