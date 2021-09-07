import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riven/modules/builds/presentation/views/build.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/entities/champion_counter.dart';
import 'package:riven/shared/domain/entities/champion_stats.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  late BuildScreen screen;
  late Widget widget;
  late Build build;

  setUp(() {
    screen = BuildScreen();
    build = Build(
      champion: ChampionStats(
        name: 'Riven',
        portraitUrl: '',
        winrate: 0,
        role: '',
        tier: '',
        pickrate: 0,
        gamesAnalyzed: 0,
        banrate: 0,
      ),
      spells: [],
      items: [],
      runes: [],
      skillPriority: [],
      earlyItems: [],
      countereds: [
        ChampionCounter(
          gamesCount: 0,
          name: 'Darius',
          portraitUrl: 'portraitUrl',
          winrate: 0,
        ),
      ],
      counters: [
        ChampionCounter(
          gamesCount: 0,
          name: 'Quinn',
          portraitUrl: 'portraitUrl',
          winrate: 0,
        ),
      ],
    );
    widget = MaterialApp(
      routes: {
        '/': (context) => Container(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(BuildScreen.route, arguments: build);
                },
              ),
            ),
        BuildScreen.route: (context) => screen,
      },
    );
  });
  group('Build Screen: ', () {
    testWidgets('Should render a build screen', (tester) async {
      await tester.pumpWidget(widget);
      await tester.tap(
        find.byType(MaterialButton),
      );
      await tester.pumpAndSettle();
      expect(
        find.text('Riven'),
        findsOneWidget,
      );
      expect(
        find.text('Estatísticas'),
        findsOneWidget,
      );
      expect(
        find.text('Feitiços de invocador'),
        findsOneWidget,
      );
      expect(
        find.text('Ordem das habilidades'),
        findsOneWidget,
      );
      expect(
        find.text('Runas'),
        findsOneWidget,
      );
      expect(
        find.text('Itens iniciais'),
        findsOneWidget,
      );
      expect(
        find.text('Itens finais'),
        findsOneWidget,
      );
      expect(
        find.byType(SalomonBottomBar),
        findsOneWidget,
      );
    });
  });
}
