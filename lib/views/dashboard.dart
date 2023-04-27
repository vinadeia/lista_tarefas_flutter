import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:app_test_flutter/model/model_estacao_meteorologica.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/card_prev_temp.dart';
import '../components/menu_lateral.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerGeral>();

    // String mensagem = controller.error == ''
     
    //  ? 'Latitude: ${controller.lat} | Longitude: ${controller.long}'
    //   : controller.error;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: const MenuLateral(),
        body: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CardPrevTemp()
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}