import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/views/builds.dart';
import 'package:riven/modules/home/presentation/presenters/home_store.dart';
import 'package:riven/modules/search/presentation/views/search.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeStore _homeStore;
  late PageController _pageController;

  @override
  void initState() {
    _homeStore = HomeStore();
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _homeStore.pageIndex,
        onTap: (i) => setState(
          () {
            _homeStore.pageIndex = i;
            _pageController.jumpToPage(i);
          },
        ),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Pesquisar"),
            selectedColor: purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.book),
            title: Text("Builds"),
            selectedColor: purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favoritos"),
            selectedColor: purple,
          ),
        ],
      ),
      body: PageView(
        pageSnapping: false,
        physics: new NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Search(),
          Builds(),
          Container(
            color: red,
          ),
        ],
      ),
    );
  }
}
