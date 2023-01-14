import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'local_hello_source_interface.dart';

class LocalHelloSource
    with HiveErrorHandlerMixin
    implements LocalHelloSourceInterface {
  final Box<String> _box;

  LocalHelloSource._({
    Box<String>? box,
  }) : _box = box ?? Hive.box<String>(StorageKey.hello.box);

  LocalHelloSource.test({
    required Box<String> moxBox,
  }) : _box = moxBox;

  static final LocalHelloSource instance = LocalHelloSource._();

  factory LocalHelloSource() => instance;

  @override
  String? fetchHelloData() => handleSyncError(
        _fetchHelloData(),
      );

  @override
  Future<void> storeHelloData(String value) => handleError(
        _storeHelloData(value),
      );

  String? _fetchHelloData() {
    return _box.get(StorageKey.hello.key);
  }

  Future<void> _storeHelloData(String value) async {
    await _box.put(StorageKey.hello.key, value);
  }

  @override
  Future<void> initStorage() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(StorageKey.hello.box);
    print('box opened');
  }
}
