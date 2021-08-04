import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riven/modules/home/presentation/presenters/home_store.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeStore _homeStore;

  @override
  void initState() {
    _homeStore = HomeStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: 0,
        onTap: (i) => setState(
          () => 0,
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
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Riven",
                style: GoogleFonts.inter(
                  color: primaryGreen,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => value,
                decoration: InputDecoration(
                  labelText: 'Nome do campeão',
                  suffix: InkWell(
                    onTap: () => print(
                      'Action',
                    ),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: fromCssColor('#242631'),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Últimas pesquisas",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: greyTextColor,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  InkWell(
                    onTap: () => print("Remover pesquisas do storage"),
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete,
                        color: red,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
