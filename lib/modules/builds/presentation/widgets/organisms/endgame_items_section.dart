import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/endgame_items_secion.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';

class EndgameItemsSection extends StatefulWidget {
  final EndgameItemsSectionParams data;
  const EndgameItemsSection({Key? key, required this.data}) : super(key: key);

  @override
  _EndgameItemsSectionState createState() => _EndgameItemsSectionState();
}

class _EndgameItemsSectionState extends State<EndgameItemsSection> {
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
            title: 'Itens finais',
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: children,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }
}
