part of 'local_hello_source.dart';

abstract class LocalHelloSourceInterface {
  String? fetchHelloData();

  Future<void> storeHelloData(String value);
}
