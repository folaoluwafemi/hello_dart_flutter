part of 'hello_repository.dart';

abstract class HelloRepoInterface {
  Future<void> saveHello(String hello);

  Future<String?> fetchHello();
}
