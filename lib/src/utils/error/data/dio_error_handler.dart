import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';

mixin DioErrorHandlerMixin implements ErrorHandler {
  @override
  Future<T> handleError<T>(
    Future<T> computation, {
    ErrorFallback<T>? catcher,
  }) async {
    try {
      return await computation;
    } on DioError catch (e, stackTrace) {
      Failure failure = Failure(stackTrace: stackTrace);
      if (e.type == DioErrorType.response) {
        debugPrint(e.response.toString());
        failure = failure.copyWith(message: e.response?.data);
      } else if (e.type == DioErrorType.connectTimeout) {
        debugPrint('Connection TimeOut:');
        debugPrint(e.message);
        debugPrint(e.response.toString());
        failure = failure.copyWith(message: ErrorMessages.connectionTimeOut);
      } else if (e.type == DioErrorType.receiveTimeout) {
        debugPrint('receive time out');
        failure = failure.copyWith(message: ErrorMessages.receiveTimeOut);
      } else if (e.type == DioErrorType.sendTimeout) {
        debugPrint('Send Time out');
        failure = failure.copyWith(message: ErrorMessages.sendTimeOut);
      }
      debugPrint(failure.toString());
      return catcher?.call(failure) ?? Future.error(failure);
    } catch (e, stackTrace) {
      late Failure failure;
      if (e is! Failure) {
        failure = Failure(message: '$e', stackTrace: stackTrace);
      } else {
        failure = e;
      }

      debugPrint(failure.toString());

      return catcher?.call(failure) ?? Future.error(failure);
    }
  }
}
