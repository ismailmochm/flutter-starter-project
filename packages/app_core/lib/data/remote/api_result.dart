import 'package:app_core/data/remote/api_exception.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiSuccess(this.data);
}

class ApiFailure<T> extends ApiResult<T> {
  final ApiException error;
  const ApiFailure(this.error);
}
