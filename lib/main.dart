import 'package:flutter/widgets.dart';
import 'package:hello_dart_flutter/src/global/global_barrel.dart';
import 'package:hello_dart_flutter/src/utils/utils_barrel.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>(StorageKey.hello.box);
  runApp(const HelloDartFlutterApp());
}
