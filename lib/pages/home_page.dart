import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/homebloc/homebloc_cubit.dart';
import 'package:test_bloc/utils/enum_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomePageScreen();
  }
}

class _HomePageScreen extends StatelessWidget {
  const _HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Test bloc multi State'),
            ],
          ),
          BlocBuilder<MainBlocCubit, MainBlocState>(builder: (context, state) {
           return Text('${state.runtimeType}');
          }),
          const SizedBox(height: 100),
          BlocBuilder<MainBlocCubit, MainBlocState>(
            buildWhen: (previous, current) => current is MainNewLanguageState,
            builder: (context, state) {
              if (state is MainInitialState) {
                return Text('Current Language is: ${state.language}');
              } else if (state is MainNewLanguageState) {
                return Text('Current Language is: ${state.language}');
              }
              return Container();
            },
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainBlocCubit>()
                        .changeLanguage(language: 'ITALIAN');
                  },
                  child: const Text("ITALIAN")),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainBlocCubit>()
                        .changeLanguage(language: 'ENGLISH');
                  },
                  child: const Text("ENGLISH"))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainBlocCubit>()
                        .changeTheme(theme: ThemeType.dark);
                  },
                  child: const Text("DARK THEME")),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainBlocCubit>()
                        .changeTheme(theme: ThemeType.light);
                  },
                  child: const Text("LIGHT THEME"))
            ],
          ),
        ],
      ),
    );
  }
}
