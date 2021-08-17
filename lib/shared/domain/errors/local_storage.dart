import 'package:riven/shared/domain/errors/domain_exception.dart';

class LocalStorageError implements DomainException {
  final int? code;
  final String message;
  final String? stackTrace;
  LocalStorageError({
    this.code,
    required this.message,
    this.stackTrace,
  });
}
