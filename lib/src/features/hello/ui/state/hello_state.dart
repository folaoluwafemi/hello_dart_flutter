part of 'hello_cubit.dart';

enum HelloStatus {
  initial,
  loading,
  success,
  error,
}

class HelloState extends BlocState {
  final String? hello;
  final Failure? error;
  final HelloStatus status;

  const HelloState({
    this.hello,
    this.error,
    required this.status,
  }) : assert(
          (status == HelloStatus.error) ? error != null : true,
          'Error status must have a corresponding error object',
        );

  HelloState copyWith({
    final String? hello,
    final Failure? error,
    final HelloStatus? status,
  }) {
    return HelloState(
      hello: hello ?? this.hello,
      error: error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [hello, error, status];
}
