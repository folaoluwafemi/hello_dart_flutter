import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';

abstract class ErrorState extends BlocState {
  final Failure failure;

  const ErrorState({
    required this.failure,
  });
}
