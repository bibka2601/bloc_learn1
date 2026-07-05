import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/cats_bloc.dart';
import 'package:flutter_application_2/cats_repo.dart';
import 'package:flutter_application_2/cats_screen.dart';
import 'package:flutter_application_2/dio_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DioSettings()),
        RepositoryProvider(create: (context) => CatsRepo(
          dio: RepositoryProvider.of<DioSettings>(context).dio)
          ),
      ],
      child: BlocProvider(
        create: (context) => CatsBloc(
            repo: RepositoryProvider.of<CatsRepo>(context)
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CatsScreen(),
        ),
      ),
    );
  }
}
