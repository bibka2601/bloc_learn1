part of 'cats_bloc.dart';

@immutable
abstract class CatsState {}

class CatsInitial extends CatsState {}

class CatsSuccess extends CatsState {
  final String? image;
  
  CatsSuccess({required this.image});
}

class CatsError  extends CatsState {}


