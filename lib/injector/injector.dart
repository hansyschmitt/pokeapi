import 'package:get_it/get_it.dart';
import 'package:pokedex/injector/get_it_injector.dart';

abstract class Injector {
  static late Injector instance;

  static Injector get i => instance;
  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc);
  void registerSingleton<T extends Object>(T instance);
  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc);

  static Injector register(Injector implementation) {
    instance = implementation;
    return instance;
  }

  static Injector build() {
    instance = GetItInjector();
    return instance;
  }

  T resolve<T extends Object>({bool ifExist = false});
}
