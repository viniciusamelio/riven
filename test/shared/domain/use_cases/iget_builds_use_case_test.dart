import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/champion_build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';
import 'package:riven/shared/domain/repositories/build.dart';
import 'package:riven/shared/domain/use_cases/builds/get_builds.dart';

class BuildRepositoryImpl extends Mock implements BuildRepository {}

void main() {
  late BuildRepository repository;
  late GetBuilds useCase;

  setUp(() {
    repository = BuildRepositoryImpl();
    useCase = GetBuilds(repository);
  });

  test('Should return a list of builds', () async {
    when(() => repository.list()).thenAnswer(
      (_) async => Right(
        <Build>[],
      ),
    );

    final result = await useCase.call();

    expect(result.isRight(), true);
    expect(result.fold((l) => l, (r) => r), isA<List<Build>>());
    verify(() => repository.list()).called(1);
  });

  test('Should return a Champion Build Error', () async {
    when(() => repository.list()).thenAnswer(
      (_) async => Left(
        ChampionBuildError(message: 'Build não encontrada'),
      ),
    );

    final result = await useCase.call();

    expect(result.isRight(), false);
    expect(result.fold((l) => l, (r) => r), isA<DomainException>());
    verify(() => repository.list()).called(1);
  });
}
