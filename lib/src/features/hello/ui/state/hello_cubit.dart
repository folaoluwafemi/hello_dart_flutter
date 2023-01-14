import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_dart_flutter/src/features/features_barrel.dart';
import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';

part 'hello_state.dart';

class HelloCubit extends Cubit<HelloState> with BlocErrorHandlerMixin {
  final HelloRepoInterface _repo;

  HelloCubit({HelloRepoInterface? repo})
      : _repo = repo ?? HelloRepository(),
        super(HelloState(status: HelloStatus.initial));

  Future<void> saveHello(String helloData) => handleError(
        _saveHello(helloData),
        catcher: _generalErrorHandler,
      );

  Future<void> _saveHello(String helloData) async {
    state.copyWith(status: HelloStatus.loading);
    await _repo.saveHello(helloData);
    state.copyWith(
      status: HelloStatus.success,
      hello: helloData,
    );
  }

  Future<void> fetchHello() => handleError(
        _fetchHello(),
        catcher: _generalErrorHandler,
      );

  Future<void> _fetchHello() async {
    state.copyWith(status: HelloStatus.loading);
    final String? hello = await _repo.fetchHello();
    state.copyWith(
      status: HelloStatus.success,
      hello: hello,
    );
  }

  void _generalErrorHandler(Failure error) {
    emit(state.copyWith(error: error, status: HelloStatus.error));
  }
}
