part of 'network_hello_source.dart';

abstract class NetworkHelloSourceInterface {
  Future<String?> fetchHelloData();

  Future<void> postHelloData(String data);
}
