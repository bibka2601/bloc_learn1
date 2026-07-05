import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/model/model.dart';
import 'package:meta/meta.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  CatsBloc() : super(CatsInitial()) {
    on<PressButtonEvent>((event, emit) async {
      Dio dio = Dio();
      final response = await dio.get(
        'https://api.thecatapi.com/v1/images/search',
      );
      final Cats result = Cats.fromJson(response.data);
      emit(CatsSuccess(image: result.url));
    });
  }
}
