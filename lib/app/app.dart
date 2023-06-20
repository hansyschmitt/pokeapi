import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/dex/presentation/bloc/filter_cubit.dart/filter_cubit.dart';
import 'package:pokedex/features/dex/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:pokedex/features/dex/presentation/features/home/home_page.dart';
import 'package:pokedex/injector/injector.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(
              create: (_) => Injector.i.resolve<HomeCubit>(),
            ),
            BlocProvider<FilterCubit>(
              create: (_) => Injector.i.resolve<FilterCubit>(),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
