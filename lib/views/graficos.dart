import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:flutter/material.dart';
import '../components/menu_lateral.dart';

class Graficos extends StatelessWidget {
  final ControllerGeral controllerGeral;
  const Graficos({super.key, required this.controllerGeral});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: MenuLateral(
          controller: controllerGeral,
        ),
        body: const Center(
          child: Text('Gráficos')
        ),
      ),
    );
  }
}