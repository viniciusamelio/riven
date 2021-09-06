import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/endgame_items_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/runes_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/skill_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/spell_section.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/starting_items_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/params/build_page.dart';
import 'package:riven/modules/builds/presentation/widgets/params/endgame_items_secion.dart';
import 'package:riven/modules/builds/presentation/widgets/params/runes_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/skill_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/spell_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/starting_items_section.dart';
import 'package:riven/shared/presentation/styles/padding.dart';

class BuildPage extends StatelessWidget {
  final BuildPageParams data;
  const BuildPage({Key? key, required this.data}) : super(key: key);

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
            BuildHeader(
              data: BuildHeaderParams(
                build: data.build,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SpellSection(
              data: SpellSectionParams(
                spells: data.build.spells!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RunesSection(
              data: RunesSectionParams(
                runes: data.build.runes!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SkillSection(
              data: SkillSectionParams(
                skills: data.build.skillPriority!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StartingItemsSection(
              data: StartingItemsSectionParams(
                items: data.build.earlyItems!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            EndgameItemsSection(
              data: EndgameItemsSectionParams(
                items: data.build.items!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
