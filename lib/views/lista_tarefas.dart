import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/menu_lateral.dart';
import '../components/model_tarefa.dart';
import 'formulario_add_tarefa.dart';

class ListaTarefas extends StatefulWidget {
  ControllerGeral controller;
  ListaTarefas({super.key, required this.controller});

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  final TextEditingController prioridadeController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController responsavelController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  late final LocalKey? key;
  bool? statusTeste;
  
  Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SimpleDialog(
          insetPadding: const EdgeInsets.all(0),
          title: const Text('Adicionar nova tarefa.'),
          // content: const Text('Adicionar nova tarefa'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                  child:Column(
                    children: [
                      FormularioAddTarefa(
                        descricaoController: descricaoController,
                        prioridadeController: prioridadeController,
                        responsavelController: responsavelController,
                        statusController: statusController,
                        statusTeste: statusTeste,
                        tipoController: tipoController,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: ElevatedButton( 
                                onPressed: (){
                                  Navigator.of(context).pop(false);       
                                  prioridadeController.clear();
                                  tipoController.clear();
                                  descricaoController.clear();
                                  responsavelController.clear();
                                  statusController.clear();
                                }, 
                                child: const Text('Cancelar'), 
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  
                                  setState(() {
                                    widget.controller.listaDeTarefas.addAll([
                                      ModelTarefa(
                                        prioridade: prioridadeController.text,
                                        descricao: descricaoController.text,
                                        tipo: tipoController.text,
                                        responsavel: responsavelController.text, 
                                        status: statusTeste,
                                        valueCheck: false
                                      )
                                    ]);
                                  });
                                  Navigator.of(context).pop(false);
                                  prioridadeController.clear();
                                  tipoController.clear();
                                  descricaoController.clear();
                                  responsavelController.clear();
                                  statusController.clear();
                                },
                                child: const Text('Salvar'), 
                              ),
                            ),
                          ],
                        ),
                      ),
                  ]
                )
              ),
            ),
          ]
        ),
      )
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: MenuLateral( controller: widget.controller),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Tarefas',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 25
                            ),
                          ),
                          const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children:[
                              Card(
                                child: SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text('CONCLUIDAS'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text('CANCELADAS'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text('ABERTAS'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: _onBackPressed,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    Text("Adicionar Tarefa")
                                  ],
                                ),
                              )
                            ],
                          )
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
      ),
    );
  }
}