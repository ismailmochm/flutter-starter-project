import 'package:app_core/app_core.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              responseType: ResponseType.json,
            ),
          );

  // ================= GET =================
  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parser,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return ApiSuccess(parser(response.data));
    } on DioException catch (e) {
      return ApiFailure(_mapDioError(e));
    } catch (_) {
      return const ApiFailure(UnknownApiException());
    }
  }

  // ================= POST =================
  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parser,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
      );
      return ApiSuccess(parser(response.data));
    } on DioException catch (e) {
      return ApiFailure(_mapDioError(e));
    } catch (_) {
      return const ApiFailure(UnknownApiException());
    }
  }

  // ================= PUT =================
  Future<ApiResult<T>> put<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parser,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: body,
        queryParameters: queryParameters,
      );
      return ApiSuccess(parser(response.data));
    } on DioException catch (e) {
      return ApiFailure(_mapDioError(e));
    } catch (_) {
      return const ApiFailure(UnknownApiException());
    }
  }

  // ================= DELETE =================
  Future<ApiResult<T>> delete<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) parser,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: body,
        queryParameters: queryParameters,
      );
      return ApiSuccess(parser(response.data));
    } on DioException catch (e) {
      return ApiFailure(_mapDioError(e));
    } catch (_) {
      return const ApiFailure(UnknownApiException());
    }
  }

  // ================= ERROR MAPPER =================
  ApiException _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutApiException();

      case DioExceptionType.connectionError:
        return const NetworkException();

      case DioExceptionType.badResponse:
        return ServerException(e.response?.data?['message'] ?? 'Server error');

      default:
        return const UnknownApiException();
    }
  }
}
