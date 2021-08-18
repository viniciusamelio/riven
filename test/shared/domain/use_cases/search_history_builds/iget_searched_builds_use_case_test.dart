import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/get_searched_builds.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/iget_searched_builds_use_case.dart';

class SearchHistoryBuildsRepositoryImpl extends Mock
    implements SearchHistoryBuildsRepository {}

void main() {
  late SearchHistoryBuildsRepository repository;
  late IGetSearchedBuildsUseCase useCase;

  setUp(() {
    repository = SearchHistoryBuildsRepositoryImpl();
    useCase = GetSearchedBuildsUseCase(repository);
  });

  group('SearchHistoryBuildsRepository: ', () {
    test('Should return a list of builds', () async {
      when(() => repository.list()).thenAnswer(
        (_) async => Right(
          <Build>[],
        ),
      );

      final result = await useCase();

      expect(result.isRight(), true);
      expect(result.fold((l) => l, (r) => r), isA<List<Build>>());
    });

    test('Should return a Local Storage Error', () async {
      when(() => repository.list()).thenAnswer(
        (_) async => Left(
          LocalStorageError(message: ''),
        ),
      );

      final result = await useCase();

      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<LocalStorageError>());
    });
  });
}
