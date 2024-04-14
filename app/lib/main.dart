import 'package:flutter/material.dart';
import 'package:wakey/app.dart';
import 'package:wakey/storage/app_storage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();

  runApp(const WakeyApp());
}