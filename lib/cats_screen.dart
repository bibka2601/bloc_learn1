import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/cats_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsScreen extends StatelessWidget {
  const CatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<CatsBloc, CatsState>(
            builder: (context, state) {
              if(state is CatsSuccess) {
                return Image.network(
                state.image ?? '',
              );
              }
              if(state is CatsError) {
                return Image.network('https://dsv16luwmjfsl.cloudfront.net/wp-content/uploads/2022/02/404_not_found.png');
              }
              return Center(
                child: Image.network(
                  'https://cdn2.thecatapi.com/images/2ij.jpg',
                  width: double.infinity,
                  height: 200,
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CatsBloc>(context).add(PressButtonEvent());
            }, 
            child: Text('Next')),
        ],
      ),
    );
  }
}
