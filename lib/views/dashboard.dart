import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:app_test_flutter/model/model_estacao_meteorologica.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: const MenuLateral(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Text('Dashboard',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(91, 91, 91, 1),
                      fontSize: 25
                    )
                  ),
                ),
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
            ),
          )
        ),
      ),
    );
  }
}