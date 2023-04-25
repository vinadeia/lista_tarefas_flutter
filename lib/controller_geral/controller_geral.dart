import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ControllerGeral extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';
  String apiPrevisao = 'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=c4e512796a173002be11c691405d4df9';

  ControllerGeral(){
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();

      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      error = e.toString();
    }

    notifyListeners();
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