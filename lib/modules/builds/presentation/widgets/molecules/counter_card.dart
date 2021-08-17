import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:riven/modules/builds/presentation/widgets/params/counter_card.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';

class CounterCard extends StatefulWidget {
  final CounterCardParams data;

  CounterCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _CounterCardState createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  final decimalFormatter = NumberFormat.decimalPattern('pt-BR');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.data.onTap(),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
          top: 12,
        ),
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: spotlightDark.withAlpha(75),
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.data.champion.portraitUrl,
                height: 120,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.data.champion.name,
                style: assetLabelTextStyle(
                  size: 17,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                decimalFormatter.format(widget.data.champion.gamesCount) +
                    '\nGames Analisados',
                textAlign: TextAlign.center,
                style: assetLabelTextStyle(
                  color: greyTextColor,
                  size: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
