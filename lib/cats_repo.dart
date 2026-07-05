import 'package:dio/dio.dart';
import 'package:flutter_application_2/model/model.dart';

class CatsRepo {
  final Dio dio;

  CatsRepo({required this.dio});

  Future<String> getCatsUrl() async{
    final response = await dio.get('https://api.thecatapi.com/v1/images/search');
    final image = Cats.fromJson(response.data).url;
    return image ?? '';
  }
}