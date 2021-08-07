import 'package:flutter/material.dart';
import 'package:riven/shared/presentation/widgets/molecules/portraits.dart';
import 'package:riven/shared/presentation/widgets/params/portrait_grid.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class PortraitsGrid extends StatelessWidget {
  final PortraitGridParams data;

  const PortraitsGrid({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: data.builds.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: data.maxCrossAxisExtent ?? 4,
        ),
        itemBuilder: (context, index) {
          final champion = data.builds[index].champion;
          return Portrait(
            data: PortraitParams(
              accentColor: data.accentColor ?? Colors.transparent,
              imageUrl: champion!.portraitUrl,
              name: champion.name,
              size: data.portraitsSize ?? 10,
              lane: champion.role,
              onTap: () => Navigator.of(context).pushNamed(
                data.routeName!,
                arguments: data.builds[index],
              ),
            ),
          );
        });
  }
}
