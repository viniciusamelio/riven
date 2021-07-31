import 'package:riven/shared/domain/errors/domain_exception.dart';

class ChampionBuildError implements DomainException {
  final int? code;
  final String message;
  final String? stackTrace;

  ChampionBuildError({this.code, required this.message, this.stackTrace});
}
