import 'package:app_test_flutter/core/client_http.dart';
import 'package:app_test_flutter/model/model_estacao_meteorologica.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';

class ControllerGeral extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';
  final ClientHttp requisicao = ClientHttp();
  // String apiPrevisao = 'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=c4e512796a173002be11c691405d4df9';

  ControllerGeral(){
    getPosicao();

  }

  getPosicao() async {
    
    final Map<String, String> data = {
      'lang': 'pt_br',
      'units':'metric'
    };
    try {
      if(defaultTargetPlatform == TargetPlatform.android){
        Position posicao = await _posicaoAtual();
        lat = posicao.latitude;
        long = posicao.longitude;
        
      
      } else if(defaultTargetPlatform == TargetPlatform.windows){
        Position posicao = await _determinePosition();
        lat = posicao.latitude;
        long = posicao.longitude;
      }

      var dados = await requisicao.get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=c4e512796a173002be11c691405d4df9', data);

      globalEstacaoModel = ModelEstacaoMeteorologica.converterJSON(dados);
    } catch (e) {
      error = e.toString();
    }

    notifyListeners();
  }

    Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the 
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale 
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<Position> _posicaoAtual() async{
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if(!ativado){
      return Future.error('Por favor, habilite a localização no smartphone.');
    }

    permissao = await Geolocator.checkPermission();
    if(permissao == LocationPermission.denied){
      permissao = await Geolocator.requestPermission();
      if(permissao == LocationPermission.denied){
        return Future.error('Você precisa autorizar o acesso à localização.');
      }
    }

    if(permissao == LocationPermission.deniedForever){
        return Future.error('Você precisa autorizar o acesso à localização.');
    }

    return await Geolocator.getCurrentPosition();
  }

}