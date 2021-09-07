import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/search/presentation/views/search.dart';
import 'package:riven/modules/search/presentation/widgets/molecules/champion_search_tile.dart';
import 'package:riven/modules/search/presentation/widgets/organisms/champion_search_field.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/domain/entities/champion_stats.dart';

void main() {
  late Widget searchScreen;
  late Widget widget;
  setUp(() {
    searchScreen = SearchScreen();
    widget = MultiProvider(
      providers: [
        Provider<BuildSet>(
          create: (_) => BuildSet(
            builds: [
              Build(
                champion: ChampionStats(
                  name: 'Aatrox',
                  portraitUrl: '',
                  winrate: 0,
                  role: '',
                  tier: '',
                  pickrate: 0,
                  gamesAnalyzed: 0,
                  banrate: 0,
                ),
              ),
              Build(
                champion: ChampionStats(
                  name: 'Annie',
                  portraitUrl: '',
                  winrate: 0,
                  role: '',
                  tier: '',
                  pickrate: 0,
                  gamesAnalyzed: 0,
                  banrate: 0,
                ),
              ),
              Build(
                champion: ChampionStats(
                  name: 'Ahri',
                  portraitUrl: '',
                  winrate: 0,
                  role: '',
                  tier: '',
                  pickrate: 0,
                  gamesAnalyzed: 0,
                  banrate: 0,
                ),
              ),
              Build(
                champion: ChampionStats(
                  name: 'Xerath',
                  portraitUrl: '',
                  winrate: 0,
                  role: '',
                  tier: '',
                  pickrate: 0,
                  gamesAnalyzed: 0,
                  banrate: 0,
                ),
              ),
            ],
          ),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: searchScreen,
        ),
      ),
    );
  });

  group('Search Screen: ', () {
    testWidgets('Should show 4 build options when taping searchbar',
        (tester) async {
      await tester.pumpWidget(
        widget,
      );
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(ChampionSearchField), '');
      await tester.pumpAndSettle();
      expect(
        find.byType(ChampionSearchTile),
        findsNWidgets(4),
      );
    });

    testWidgets('Should show 1 build option containing N when taping searchbar',
        (tester) async {
      await tester.pumpWidget(
        widget,
      );
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(ChampionSearchField), 'n');
      await tester.pumpAndSettle();
      expect(
        find.byType(ChampionSearchTile),
        findsOneWidget,
      );
    });

    testWidgets(
        'Should show 1 build option when taping searchbar and typing xerath',
        (tester) async {
      await tester.pumpWidget(
        widget,
      );
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(ChampionSearchField), 'xerath');
      await tester.pumpAndSettle();
      expect(
        find.byType(ChampionSearchTile),
        findsOneWidget,
      );
    });

    testWidgets('Should show no build when taping searchbar and typing dota',
        (tester) async {
      await tester.pumpWidget(
        widget,
      );
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(ChampionSearchField), 'dota');
      await tester.pumpAndSettle();
      expect(
        find.byType(ChampionSearchTile),
        findsNothing,
      );
      expect(
        find.text('Campeão não encontrado'),
        findsOneWidget,
      );
    });
  });
}
