import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? errorMessage;
  final String? errorKey;
  final int timeToRetry;

  const Failure({
    this.errorMessage,
    this.errorKey,
    this.timeToRetry = -1,
  }); //error key kere bomasa required qilish shartamas
  @override
  List<Object?> get props => [
        errorMessage,
        errorKey,
        timeToRetry,
      ];
}

class ServerFailure extends Failure {
  final num statusCode;

  const ServerFailure({
    required super.errorMessage,
    required this.statusCode,
    required super.errorKey,
    super.timeToRetry,
  });
}

class DioFailure extends Failure {
  final DioExceptionType type;
  final int? statusCode;

  const DioFailure({
    required super.errorMessage,
    this.type = DioExceptionType.badResponse,
    this.statusCode,
  });
}

class ParsingFailure extends Failure {
  const ParsingFailure({required super.errorMessage});
}

class CacheFailure extends Failure {}
