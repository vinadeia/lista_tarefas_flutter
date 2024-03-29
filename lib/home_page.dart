
import 'package:app_test_flutter/components/menu_lateral.dart';
import 'package:app_test_flutter/controller_geral.dart';
import 'package:flutter/material.dart';
 class HomePage extends StatefulWidget {
  final ControllerGeral controllerGeral;
  const HomePage({super.key, required this.controllerGeral});

  @override
  State<HomePage> createState() => _HomePageState();
}


// Controle de estado
class _HomePageState extends State<HomePage> {

  @override
  void initState() {     // Chamado quando for construído
    super.initState();
  }

  @override
  void dispose() {      // Chamado quando for destruído
    super.dispose();
  }

  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: MenuLateral(
          controller: widget.controllerGeral,
        ),
        body: const Center(
          child: Text('Dashboard')
        ),
      ),
    );
  }
}