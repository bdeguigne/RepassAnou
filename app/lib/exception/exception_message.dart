class ExceptionMessage implements Exception {
  const ExceptionMessage(this.message);

  final String message;

  @override
  String toString() => message;
}
