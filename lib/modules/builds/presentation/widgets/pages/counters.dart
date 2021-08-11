import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/organisms/counters_section.dart';
import 'package:riven/modules/builds/presentation/widgets/params/counters.dart';
import 'package:riven/modules/builds/presentation/widgets/params/counters_section.dart';
import 'package:riven/shared/presentation/styles/padding.dart';

class CountersPage extends StatefulWidget {
  final CountersPageParams data;
  const CountersPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _CountersPageState createState() => _CountersPageState();
}

class _CountersPageState extends State<CountersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          children: [
            CountersSection(
              data: CountersSectionParams(
                  champions: widget.data.build.counters!,
                  championName: widget.data.build.champion!.name),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
