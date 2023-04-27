import 'package:app_test_flutter/core/client_http.dart';
import 'package:app_test_flutter/model/model_estacao_meteorologica.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class ControllerGeral extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';

  String condicaoTempo ='';
  String imageTempo = 'assets/ensolarado.png';
  final ClientHttp requisicao = ClientHttp();

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

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

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

  alteraCondicaoTempo(condicao){print(condicao);
    switch (condicao) {
      case "Clear": 
        condicaoTempo = 'Ensolarado';
        imageTempo = 'assets/ensolarado.png';
        break;
      case "rainy": 
        condicaoTempo = 'Chuvoso';
        imageTempo = 'assets/chuvoso.png';
        break;
      case "nublado": 
        condicaoTempo = 'Sol entre nuvens';
        imageTempo = 'assets/sol_entre_nuvens.png';
        break;
      default:
    }
    notifyListeners();
  }

}