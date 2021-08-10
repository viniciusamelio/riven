import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/endgame_items_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/runes_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/skill_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/spell_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/starting_items_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/params/endgame_items_secion.dart';
import 'package:riven/modules/builds/presentation/widgets/params/runes_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/skill_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/spell_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/starting_items_section.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/padding.dart';
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
