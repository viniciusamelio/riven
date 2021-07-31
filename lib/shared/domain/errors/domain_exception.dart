abstract class DomainException {
  final String message;
  final int? code;
  final String? stackTrace;

  DomainException({required this.message, this.code, this.stackTrace});
}
