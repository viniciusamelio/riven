import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/spell_section.dart';

class SpellSection extends StatefulWidget {
  final SpellSectionParams data;
  const SpellSection({Key? key, required this.data}) : super(key: key);

  @override
  _SpellSectionState createState() => _SpellSectionState();
}

class _SpellSectionState extends State<SpellSection> {
  final List<Widget> children = [];

  @override
  void initState() {
    for (var spell in widget.data.spells) {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          data: SectionTitleParams(
            title: 'Feitiços de invocador',
          ),
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ],
    );
  }
}
