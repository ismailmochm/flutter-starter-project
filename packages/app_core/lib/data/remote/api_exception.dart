abstract class ApiException implements Exception {
  final String message;
  const ApiException(this.message);
}

class NetworkException extends ApiException {
  const NetworkException() : super('No internet connection');
}

class TimeoutApiException extends ApiException {
  const TimeoutApiException() : super('Request timeout');
}

class ServerException extends ApiException {
  const ServerException([super.msg = 'Server error']);
}

class UnknownApiException extends ApiException {
  const UnknownApiException() : super('Unknown error');
}
