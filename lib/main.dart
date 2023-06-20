import 'package:flutter/material.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/injector/injection_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initInjections();
  runApp(const App());
}

Future<void> _initInjections() async {
  await InjectionManager.register();
}
