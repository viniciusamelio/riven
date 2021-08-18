import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/iremove_searched_builds_use_case.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/remove_searched_build.dart';

class SearchHistoryBuildsRepositoryImpl extends Mock
    implements SearchHistoryBuildsRepository {}

void main() {
  late SearchHistoryBuildsRepository repository;
  late IRemoveSearchedBuildsUseCase usecase;

  setUp(() {
    repository = SearchHistoryBuildsRepositoryImpl();
    usecase = RemoveSearchedBuildsUseCase(repository);
  });

  group('RemoveSearchedBuildsUseCase: ', () {
    test('Should return a String Message', () async {
      when(() => repository.remove()).thenAnswer(
        (_) async => Right('Histórico limpo'),
      );

      final result = await usecase();
      expect(result.isRight(), true);
      expect(result.fold((l) => l, (r) => r), isA<String>());
    });

    test('Should return a Local Storage Error', () async {
      when(() => repository.remove()).thenAnswer(
        (_) async => Left(
          LocalStorageError(message: 'Erro'),
        ),
      );

      final result = await usecase();
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<LocalStorageError>());
    });
  });
}
