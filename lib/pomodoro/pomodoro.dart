// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:app_test_flutter/controller_geral.dart';

class PomodoroView extends StatefulWidget {
  final ControllerGeral controller;
  
  const PomodoroView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PomodoroView> createState() => _PomodoroViewState();
}

class _PomodoroViewState extends State<PomodoroView> {
  String dataTime = DateFormat('dd/MM/yyyy').format(DateTime.now());
  int timerLeft = 10;

  contadorTempo(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      
        if (timerLeft > 0) {
          setState(() {
            timerLeft--; // é igual a timerLeft = timerLert -1;
          });
        } else {
          timer.cancel();
        }
      });
  }

  @override
  void initState() {
    setState(() {
      timerLeft = widget.controller.listaDeTarefas[0].tempoDeterminado != null ?
      int.parse(widget.controller.listaDeTarefas[0].tempoDeterminado.toString()) : timerLeft;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Pomodoro'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${widget.controller.listaDeTarefas[0].descricao}'), // em qual momento da repetição
                        Text(timerLeft == 0 ? 'concluido' : timerLeft.toString()),
                        const Text('segundos : 00'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: (() {
                              contadorTempo();
                            }),
                              child: const Text('Start')
                            ),
                            ElevatedButton(
                              onPressed: (() {
                              
                            }),
                              child: const Text('Zerar')
                            )
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                  widget.controller.listaDeTarefas.isEmpty ? Text('VAZIO') :
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: widget.controller.listaDeTarefas.map((e) =>
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.amber[50],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(dataTime)
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${e.descricao}'),
                                        Icon(Icons.star)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        )
                      ).toList()
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}