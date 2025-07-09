class FKHttpException implements Exception {
  const FKHttpException({required this.error, required this.message});

  final Object? error;
  final String? message;
}
