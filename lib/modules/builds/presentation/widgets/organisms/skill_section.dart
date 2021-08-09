import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/skill_section.dart';
import 'package:riven/shared/presentation/styles/color.dart';

class SkillSection extends StatefulWidget {
  final SkillSectionParams data;
  const SkillSection({Key? key, required this.data}) : super(key: key);

  @override
  _SkillSectionState createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection> {
  final List<Widget> children = [];

  @override
  void initState() {
    for (var skill in widget.data.skills) {
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

      if (skill != widget.data.skills[widget.data.skills.length - 1]) {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          data: SectionTitleParams(
            title: 'Ordem das habilidades',
          ),
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        )
      ],
    );
  }
}
