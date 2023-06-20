import 'package:get_it/get_it.dart';
import 'package:pokedex/injector/injector.dart';

class GetItInjector implements Injector {
  factory GetItInjector() {
    return _singleton;
  }

  GetItInjector._internal();

  static final GetItInjector _singleton = GetItInjector._internal();
  final GetIt _getIt = GetIt.asNewInstance();

  @override
  void registerFactory<T extends Object>(factoryFunc) {
    if (_isRegistered<T>()) {
      _getIt.unregister<T>();
    }
    _getIt.registerFactory<T>(factoryFunc);
  }

  @override
  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc) {
    if (!_isRegistered<T>()) {
      _getIt.registerLazySingleton<T>(factoryFunc);
    }
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    if (_isRegistered<T>()) {
      _getIt.unregister<T>();
    }
    _getIt.registerSingleton<T>(instance);
  }

  bool _isRegistered<T extends Object>() => _getIt.isRegistered<T>();

  @override
  T resolve<T extends Object>({bool ifExist = false}) {
    if (ifExist && !_isRegistered<T>()) {
      throw Exception('Injector: $T object was not found');
    }
    return _getIt.get<T>();
  }
}
