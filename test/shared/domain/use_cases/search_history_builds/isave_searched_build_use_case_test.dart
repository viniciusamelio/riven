import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/local_storage.dart';
import 'package:riven/shared/domain/repositories/search_history_builds.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/isave_searched_build_use_case.dart';
import 'package:riven/shared/domain/use_cases/search_history_builds/save_searched_build.dart';

class SearchHistoryBuildsRepositoryImpl extends Mock
    implements SearchHistoryBuildsRepository {}

void main() {
  late SearchHistoryBuildsRepository repository;
  late ISaveSearchedBuildUseCase useCase;

  setUp(() {
    repository = SearchHistoryBuildsRepositoryImpl();
    useCase = SaveSearchedBuild(repository);
  });

  test('Should return a local storage error', () async {
    when(() => repository.save('Aatrox', Build())).thenAnswer(
      (_) async => Left(LocalStorageError(
          message: 'Erro ao acessar o disco rígido do dispositivo')),
    );

    final result = await useCase(
      'Aatrox',
      Build(),
    );

    expect(result.isLeft(), true);
    expect(result.fold((l) => l, (r) => r), isA<LocalStorageError>());
  });

  test('Should return a build', () async {
    when(() => repository.save('Aatrox', Build())).thenAnswer(
      (_) async => Right(
        Build(),
      ),
    );

    final result = await useCase.call(
      'Aatrox',
      Build(),
    );

    expect(result.isLeft(), false);
    expect(result.fold((l) => l, (r) => r), isA<Build>());
  });
}
