import 'package:pokedex/features/dex/domain/model/pokemon.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class EmptyHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<Pokemon> pokemons;
  SuccessHomeState({required this.pokemons});
}
