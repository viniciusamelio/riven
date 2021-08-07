import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/params/section_title.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/text.dart';

class SectionTitle extends StatelessWidget {
  final SectionTitleParams data;
  const SectionTitle({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title,
          style: headerFourStyle(
            color: data.textColor ?? Colors.white,
          ),
        ),
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(
            color: data.lineColor ?? primaryGreen,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
