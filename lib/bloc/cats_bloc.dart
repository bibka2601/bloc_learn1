import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/cats_repo.dart';
import 'package:flutter_application_2/model/model.dart';
import 'package:meta/meta.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  CatsBloc({required this.repo}) : super(CatsInitial()) {
    on<PressButtonEvent>((event, emit) async {
     try {
      final image = await repo.getCatsUrl();
      emit(CatsSuccess(image: image));
     } catch (e) {
      emit(CatsError());
     }
    });
  }
  final CatsRepo repo;
}
