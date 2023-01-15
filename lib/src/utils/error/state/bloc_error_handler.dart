import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';

mixin BlocErrorHandlerMixin implements ErrorHandler {
  @override
  Future<T> handleError<T>(
    Future<T> computation, {
    ErrorFallback<T>? catcher,
  }) async {
    try {
      return await computation;
    } catch (e, stackTrace) {
      late Failure failure;
      if (e is! Failure) {
        failure = Failure(message: '$e', stackTrace: stackTrace);
      } else {
        failure = e;
      }
      debugPrint(failure.toString());

      print('current stackTrace: ${StackTrace.current} \n\nError stackTrace: $stackTrace');

      return catcher != null ? catcher.call(failure) : Future<T>.error(failure);
    }
  }
}
