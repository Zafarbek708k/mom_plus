import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mom_plus/core/exceptions/exceptions.dart';
import 'package:mom_plus/core/exceptions/failures.dart';
import 'package:mom_plus/core/utils/either.dart';

enum RequestMethodEnum { get, post, put, delete, patch }

class RequestHandlerService {
  final Dio dio;

  const RequestHandlerService(this.dio);

  Future<T> handleRequest<T>({
    required Future<T> Function(Response) fromJson,
    required String path,
    RequestMethodEnum? method,
    Options? options,
    Map<String, dynamic>? queryParameters,
    Object? data,
    Dio? newDio,
  }) async {
    try {
      final response = await (newDio ?? dio).request(
        path,
        options: options ?? Options(method: method?.name ?? RequestMethodEnum.get.name),
        queryParameters: queryParameters,
        data: data,
      );
      final result = fromJson.call(response);
      return result;
    } on DioException catch (e) {
      // final errorResponse = ErrorModel.fromJson(e.response?.data);
      throw CustomDioException(
        errorMessage: e.message ?? 'something went wrong',
        type: e.type,
        statusCode: e.response?.statusCode,
      );
    } on ParsingException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    } catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  Future<Either<Failure, T>> handleRequestInRepository<T>({
    required Future<T> Function() onRequest,
    String debugLabel = '',
  }) async {
    try {
      final result = await onRequest.call();
      return Right(result);
    } on ParsingException catch (e) {
      log("ParsingException in $debugLabel: ${e.errorMessage}");
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on CustomDioException catch (e) {
      log("CustomDioException in $debugLabel: ${e.errorMessage}");
      return Left(DioFailure(errorMessage: e.errorMessage, type: e.type, statusCode: e.statusCode));
    } on Exception catch (e) {
      log("Exception in $debugLabel: ${e.toString()}");
      return Left(ParsingFailure(errorMessage: e.toString()));
    }
  }
}
