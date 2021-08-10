import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/rune_title.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/game_asset_image.dart';
import 'package:riven/modules/builds/presentation/widgets/params/rune_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/runes_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';

class RunesSection extends StatefulWidget {
  final RunesSectionParams data;
  const RunesSection({Key? key, required this.data}) : super(key: key);

  @override
  _RunesSectionState createState() => _RunesSectionState();
}

class _RunesSectionState extends State<RunesSection> {
  final List<Widget> children = [];

  @override
  void didChangeDependencies() {
    for (var runeset in widget.data.runes) {
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RuneTitle(
                data: RuneTitleParams(
                  imageUrl: runeset.imageUrl,
                  label: runeset.name,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 55,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: runeset.runes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = runeset.runes[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GameAssetImage(
                          data: GameAssetImageParams(
                            imageUrl: item.imageUrl,
                            size: index > 1 && runeset.runes.length == 5
                                ? 20
                                : index == 0 && runeset.runes.length == 4
                                    ? 35
                                    : 30,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          data: SectionTitleParams(
            title: 'Runas',
          ),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        )
      ],
    );
  }
}
