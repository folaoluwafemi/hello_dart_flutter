import 'package:hello_dart_flutter/src/features/features_barrel.dart';

part 'interface.dart';

class HelloRepository implements HelloRepoInterface {
  final NetworkHelloSourceInterface _networkSource;
  final LocalHelloSourceInterface _localSource;

  HelloRepository._({
    NetworkHelloSourceInterface? networkSource,
    LocalHelloSourceInterface? localSource,
  })  : _networkSource = networkSource ?? NetworkHelloSource(),
        _localSource = localSource ?? LocalHelloSource();

  HelloRepository.test({
    required NetworkHelloSourceInterface networkSource,
    required LocalHelloSourceInterface localSource,
  })  : _networkSource = networkSource,
        _localSource = localSource;

  static final HelloRepository instance = HelloRepository._();

  factory HelloRepository() => instance;

  @override
  Future<String?> fetchHello() async {
    final String? networkHello = await _networkSource.fetchHelloData();
    if (networkHello != null) return networkHello;
    final String? localHello = _localSource.fetchHelloData();
    return localHello;
  }

  @override
  Future<void> saveHello(String hello) async {
    await _localSource.storeHelloData(hello);
    await _networkSource.postHelloData(hello);
  }
}
