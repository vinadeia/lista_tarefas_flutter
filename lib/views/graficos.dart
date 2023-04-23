import 'package:flutter/material.dart';
import '../components/menu_lateral.dart';

class Graficos extends StatelessWidget {
  const Graficos({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: const MenuLateral(),
        body: const Center(
          child: Text('Gráficos')
        ),
      ),
    );
  }
}