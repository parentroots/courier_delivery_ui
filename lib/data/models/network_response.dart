class NetworkResponse {
  final int statusCode;
  final bool isDone;
  final dynamic responseData;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isDone,
    this.responseData,
    this.errorMessage,
  });
}
