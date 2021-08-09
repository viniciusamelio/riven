import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/starting_items_section.dart';

class StartingItemsSection extends StatefulWidget {
  final StartingItemsSectionParams data;
  const StartingItemsSection({Key? key, required this.data}) : super(key: key);

  @override
  _StartingItemsSectionState createState() => _StartingItemsSectionState();
}

class _StartingItemsSectionState extends State<StartingItemsSection> {
  final List<Widget> children = [];

  @override
  void initState() {
    for (var item in widget.data.items) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GameAssetImage(
            data: GameAssetImageParams(
              imageUrl: item.imageUrl,
              label: item.name,
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
            title: 'Itens iniciais',
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
