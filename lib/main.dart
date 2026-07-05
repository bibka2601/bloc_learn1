import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/cats_bloc.dart';
import 'package:flutter_application_2/cats_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: CatsScreen(),
      ),
    );
  }
}
