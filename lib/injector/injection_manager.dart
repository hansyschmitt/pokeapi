import 'package:dio/dio.dart';
import 'package:pokedex/features/dex/data/repositories/pokemon_remote_repository.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/dex/presentation/bloc/home_cubit.dart';
import 'package:pokedex/injector/injector.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class InjectionManager {
  static Future<void> register() async {
    final injector = Injector.build();
    await _registerCommons(injector);
    await _registerRepositories(injector);
    await _registerCubits(injector);
  }

  static Future<void> _registerCommons(Injector injector) async {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    injector.registerSingleton<Dio>(dio);
  }

  static Future<void> _registerRepositories(Injector injector) async {
    injector.registerFactory<PokemonRepository>(
      () => PokemonRemoteRepository(
        dio: injector.resolve(),
      ),
    );
  }

  static Future<void> _registerCubits(Injector injector) async {
    injector.registerSingleton<HomeCubit>(HomeCubit(injector.resolve()));
  }
}
