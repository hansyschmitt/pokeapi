import 'package:dio/dio.dart';
import 'package:pokedex/features/dex/data/repositories/pokemon_remote_repository.dart';
import 'package:pokedex/features/dex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/injector/injector.dart';

class InjectionManager {
  static Future<void> register() async {
    final injector = Injector.build();
    await _registerCommons(injector);
    await _registerRepositories(injector);
  }

  static Future<void> _registerCommons(Injector injector) async {
    injector.registerSingleton<Dio>(Dio());
  }

  static Future<void> _registerRepositories(Injector injector) async {
    injector.registerFactory<PokemonRepository>(
      () => PokemonRemoteRepository(
        dio: injector.resolve<Dio>(),
      ),
    );
  }
}
