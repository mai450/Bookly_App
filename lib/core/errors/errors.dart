import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerError extends Failure {
  ServerError({required super.errMessage});

  factory ServerError.fromDioException(DioException dioExpection) {
    switch (dioExpection.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerError(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerError(errMessage: 'Recive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerError(errMessage: 'Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        //return ServerError(errMessage: 'Bad response with ApiServer');
        return ServerError.fromResponse(
            dioExpection.response!.statusCode!, dioExpection.response!.data);
      case DioExceptionType.cancel:
        return ServerError(errMessage: 'Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerError(errMessage: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerError(errMessage: 'Unexpected Error, Please try again!');
    }
  }
  factory ServerError.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError(
          errMessage: 'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerError(errMessage: 'Internal Server error, Please try later');
    } else {
      return ServerError(
          errMessage: 'Opps There was an Error, Please try again');
    }
  }
}
