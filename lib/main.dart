import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/homebloc/homebloc_cubit.dart';
import 'package:test_bloc/pages/home_page.dart';
import 'package:test_bloc/utils/enum_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBlocCubit(),
      child: const _MyAppView(),
    );
  }
}

class _MyAppView extends StatelessWidget {
  const _MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBlocCubit, MainBlocState>(
      buildWhen: (previous, current) => current is MainNewThemeState,
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: state is MainNewThemeState && state.theme == ThemeType.dark
              ? ThemeData(
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    backgroundColor: Colors.deepPurple,
                  ),
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                  useMaterial3: true,
                )
              : ThemeData(
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.lightGreenAccent,
                  ),
                  useMaterial3: true,
                ),
          home: const HomePage(),
        );
      },
    );
  }
}
