import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/params/stat_block.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';

class StatBlock extends StatelessWidget {
  final StatBlockParams data;
  const StatBlock({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.label,
          style: defaultTextStyle(
            size: 16,
            color: mediumGreyTextColor,
          ),
        ),
        Text(
          data.value + ' %',
          style: defaultTextStyle(
            size: 16,
            color: data.valueColor,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
