import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/stat_block.dart';
import 'package:riven/modules/builds/presentation/widgets/params/build_header.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/stat_block.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class BuildHeader extends StatelessWidget {
  final BuildHeaderParams data;
  BuildHeader({Key? key, required this.data}) : super(key: key);
  final decimalFormatter = NumberFormat.decimalPattern('pt-BR');

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
                  data.championStats.name,
                  style: headerOneStyle(),
                ),
                Text(
                  data.championStats.role,
                  style: headerThreeStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${decimalFormatter.format(data.championStats.gamesAnalyzed)} Games Analisados",
                  style: defaultTextStyle(),
                ),
              ],
            ),
            Portrait(
              data: PortraitParams(
                accentColor: primaryGreen,
                imageUrl: data.championStats.portraitUrl,
                size: 70,
                borderWidth: 3,
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
              value: decimalFormatter.format(data.championStats.banrate),
              valueColor: red,
            )),
            StatBlock(
              data: StatBlockParams(
                label: 'Taxa de pick',
                value: decimalFormatter.format(data.championStats.pickrate),
                valueColor: blue,
              ),
            ),
            StatBlock(
              data: StatBlockParams(
                label: 'Taxa de vitória',
                value: decimalFormatter.format(data.championStats.winrate),
                valueColor: golden,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
