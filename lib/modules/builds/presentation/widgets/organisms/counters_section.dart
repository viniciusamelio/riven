import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/counters_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/shared/domain/entities/champion_counter.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class CountersSection extends StatefulWidget {
  final CountersSectionParams data;
  const CountersSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _CountersSectionState createState() => _CountersSectionState();
}

class _CountersSectionState extends State<CountersSection> {
  var decimalFormatter = NumberFormat.decimalPattern('pt-BR');
  late final List<ChampionCounter> champions;

  @override
  void initState() {
    widget.data.champions.sort((a, b) => b.winrate.compareTo(a.winrate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          data: SectionTitleParams(
            title: '${widget.data.championName} countera',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: ListView.builder(
              itemCount: widget.data.champions.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final champion = widget.data.champions[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: spotlightDark.withAlpha(75),
                    ),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: champion.portraitUrl,
                          height: 120,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          champion.name,
                          style: assetLabelTextStyle(
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          decimalFormatter.format(champion.winrate) +
                              ' %\nde vitória',
                          textAlign: TextAlign.center,
                          style: assetLabelTextStyle(
                            color: primaryGreen,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          decimalFormatter.format(champion.gamesCount) +
                              ' games analisados',
                          textAlign: TextAlign.center,
                          style: assetLabelTextStyle(
                            color: primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
