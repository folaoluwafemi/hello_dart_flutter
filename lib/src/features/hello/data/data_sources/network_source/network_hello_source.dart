import 'package:dio/dio.dart';
import 'package:hello_dart_flutter/src/utils/constants/values/api_paths.dart';
import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';

part 'network_hello_source_interface.dart';

class NetworkHelloSource
    with DioErrorHandlerMixin
    implements NetworkHelloSourceInterface {
  final Dio _client;

  NetworkHelloSource._({
    Dio? box,
  }) : _client = box ?? Dio();

  NetworkHelloSource.test({
    required Dio mockClient,
  }) : _client = mockClient;

  static final NetworkHelloSource instance = NetworkHelloSource._();

  factory NetworkHelloSource() => instance;

  @override
  Future<String?> fetchHelloData() => handleError(
        _fetchHelloData(),
      );

  Future<String?> _fetchHelloData() async {
    final Response<String> response = await _client.get<String>(ApiPaths.hello);
    if (response.statusCode != 200) return null;
    return response.data;
  }

  @override
  Future<void> postHelloData(String data) => handleError(
        _postHelloData(data),
      );

  Future<void> _postHelloData(String data) async {
    await _client.post(ApiPaths.hello, data: data);
  }
}
