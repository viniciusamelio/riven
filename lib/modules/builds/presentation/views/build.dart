import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/presenters/build_store.dart';
import 'package:riven/modules/builds/presentation/widgets/pages/build.dart';
import 'package:riven/modules/builds/presentation/widgets/params/build_page.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BuildScreen extends StatefulWidget {
  const BuildScreen({Key? key}) : super(key: key);

  @override
  _BuildViewState createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildScreen> {
  late final Build _build;
  late final BuildStore _buildStore;

  @override
  void initState() {
    _buildStore = BuildStore();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _build = ModalRoute.of(context)!.settings.arguments as Build;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _buildStore.pageIndex,
        onTap: (i) => setState(
          () {
            _buildStore.pageIndex = i;
          },
        ),
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        unselectedItemColor: greyTextColor,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.book),
            title: Text("Build"),
            selectedColor: primaryGreen,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.timeline),
            title: Text("Counters"),
            selectedColor: purple,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: PageView(
        children: [
          BuildPage(
            data: BuildPageParams(
              build: _build,
            ),
          ),
          BuildPage(
            data: BuildPageParams(
              build: _build,
            ),
          ),
        ],
      ),
    );
  }
}
