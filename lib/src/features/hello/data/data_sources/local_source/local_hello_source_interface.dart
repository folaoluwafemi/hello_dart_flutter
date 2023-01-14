part of 'local_hello_source.dart';

abstract class LocalHelloSourceInterface {
  Future<void> initStorage();

  String? fetchHelloData();

  Future<void> storeHelloData(String value);
}
