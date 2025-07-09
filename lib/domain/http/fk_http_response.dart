class FKHttpResponse {
  const FKHttpResponse({
    required this.data,
    required this.statusCode,
    required this.headers,
  });

  final dynamic data;
  final int? statusCode;
  final Map<String, List<String>> headers;
}
