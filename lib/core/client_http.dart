import 'dart:developer';
import 'package:dio/dio.dart';

class ClientHttp {
  
  Future<dynamic> get(url, data) async{
    try {
      final result = await Dio().get(url, queryParameters: data);

      return result.data;

    } on DioError catch (e) {
      log('Erro ao acessar a api', error: e);
      throw Exception('Erro ao conectar a Api');
    }
  }
}