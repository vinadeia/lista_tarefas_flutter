// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:app_test_flutter/controller_geral/controller_geral.dart';

class PomodoroView extends StatefulWidget {
  ControllerGeral controller;
  
  PomodoroView({
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
                        const Text('Nome atividade da lista 2/5'), // em qual momento da repetição
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
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.amber[50],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(dataTime),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Arrumar o quarto'),
                                  Icon(Icons.star)
                                ],
                              ),
                              Text('Descricao da atividade')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            DataTable(
                              // showCheckboxColumn: true,
                              columns: const [
                                DataColumn(label: Text('Select')),
                                DataColumn(label: Text('Prioridade')),
                                DataColumn(label: Text('Tipo')),
                                DataColumn(label: Text('Descrição')),
                                DataColumn(label: Text('Responsável')),
                                DataColumn(label: Text('Status')),
                                DataColumn(label: Text('Delete')),
                              ],
                              rows: widget.controller.listaDeTarefas.map((e) =>
                                DataRow(
                                  cells: <DataCell>[
                                  DataCell(Checkbox(
                                    value: e.valueCheck,
                                    onChanged: (value) {
                                      setState(() {
                                        e.valueCheck = !e.valueCheck;
                                        print(e.descricao);
                                      });
                                    },
                                  )),
                                  DataCell(Text(e.prioridade.toString())),
                                  DataCell(Text(e.tipo.toString())),
                                  DataCell(Text(e.descricao.toString())),
                                  DataCell(Text(e.responsavel.toString())),
                                  DataCell(
                                     SizedBox(
                                      child: e.status == true ?
                                        const Icon(
                                          Icons.abc,
                                          color: Colors.green,
                                        ) : 
                                        const Icon(
                                          Icons.abc,
                                          color: Colors.red,
                                        )
                                      )
                                     
                                  ),
                                  DataCell(
                                    IconButton(
                                      icon: Icon(Icons.delete,
                                        color: Colors.red[200],
                                        size: 20,
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          widget.controller.listaDeTarefas.remove(e);
                                        });
                                      },
                                    )
                                  )
                                ],    
                                // onSelectChanged: (bool? selected) {
                                //   selected == null ? print('selected is null') : print('select is $selected');
                                //   },
                                )).toList()
                            )
                          ],
                        ),
                      )
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