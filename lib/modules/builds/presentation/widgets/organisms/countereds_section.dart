import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/counter_card.dart';
import 'package:riven/modules/builds/presentation/widgets/molecules/section_title.dart';
import 'package:riven/modules/builds/presentation/widgets/params/counter_card.dart';
import 'package:riven/modules/builds/presentation/widgets/params/counters_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/domain/entities/champion_counter.dart';

class CounteredsSection extends StatefulWidget {
  final CountersSectionParams data;
  const CounteredsSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _CounteredsSectionState createState() => _CounteredsSectionState();
}

class _CounteredsSectionState extends State<CounteredsSection> {
  var decimalFormatter = NumberFormat.decimalPattern('pt-BR');
  late final List<ChampionCounter> champions;
  late final BuildSet _buildSet;
  @override
  void initState() {
    _buildSet = Provider.of<BuildSet>(context, listen: false);
    widget.data.champions.sort(
      (a, b) => b.gamesCount.compareTo(a.gamesCount),
    );
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
          height: 225,
          child: ListView.builder(
              itemCount: widget.data.champions.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final champion = widget.data.champions[index];
                var build = _buildSet.builds.where(
                  (element) => element.champion!.name.contains(champion.name),
                );
                if (build.length < 1) return Container();

                return CounterCard(
                  data: CounterCardParams(
                    champion: champion,
                    onTap: () => Navigator.of(context).pushNamed(
                      '/build',
                      arguments: build.first,
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
