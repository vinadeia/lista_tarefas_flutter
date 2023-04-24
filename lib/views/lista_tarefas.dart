import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/menu_lateral.dart';

class ListaTarefas extends StatelessWidget {
  const ListaTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerGeral>();

    String mensagem = controller.error == ''
     
     ? 'Latitude: ${controller.lat} | Longitude: ${controller.long}'
      : controller.error;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: const MenuLateral(),
        body: Center(
          child: Text(mensagem)
        ),
      ),
    );
  }
}