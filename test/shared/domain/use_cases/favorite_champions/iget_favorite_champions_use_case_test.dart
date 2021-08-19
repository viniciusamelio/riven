import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/repositories/favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/get_favorite_champions.dart';
import 'package:riven/shared/domain/use_cases/favorite_champions/iget_favorite_champions_use_case.dart';

class FavoriteChampionsRepositoryImpl extends Mock
    implements FavoriteChampionsRepository {}

void main() {
  late FavoriteChampionsRepository repository;
  late IGetFavoriteChampionsUseCase usecase;

  setUp(() {
    repository = FavoriteChampionsRepositoryImpl();
    usecase = GetFavoriteChampions(repository);
  });

  group('GetFavoriteChampionsUseCase: ', () {
    test('Should return a list of builds', () async {
      when(() => repository.list()).thenAnswer(
        (_) async => <Build>[],
      );
      final result = await usecase();
      expect(result, isA<List<Build>>());
    });
  });
}
