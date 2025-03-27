import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection TimeOut with Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send TimeOut with Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive TimeOut with Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('The request is canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('Check internet connection and try again');

      case DioExceptionType.unknown:
        return ServerFailure('Unknown Request');

      case DioExceptionType.badCertificate:
        return ServerFailure('--');
      default:
        return ServerFailure('Opps there was an error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Server error, please try again later');
    } else {
      return ServerFailure('Opps there sas an error please try again later');
    }
  }
}
