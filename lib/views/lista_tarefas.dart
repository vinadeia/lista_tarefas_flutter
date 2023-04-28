import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/menu_lateral.dart';
import '../components/model_tarefa.dart';

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerGeral>();
    if(controller.teste == []){
      controller.addTask();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text(""),
        ),
        drawer: const MenuLateral(),
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
                          Center(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children:[
                                Card(
                                  child: SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: const [
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
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: const [
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
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: const [
                                          Text('ABERTAS'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    controller.teste.addAll([ModelTarefa(prioridade: 9, descricao: 'teste', nome: 'teste',responsavel: 'ADRIANA', status: 'FECHADO')]);
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
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
                              columns: const [
                                DataColumn(label: Text('Prioridade')),
                                DataColumn(label: Text('Nome')),
                                DataColumn(label: Text('Descrição')),
                                DataColumn(label: Text('Responsável')),
                                DataColumn(label: Text('Status')),
                              ],
                              rows: controller.teste.map((e) => 
                                DataRow(cells: <DataCell>[
                                  DataCell(Text(e.prioridade.toString())),
                                  DataCell(Text(e.nome.toString())),
                                  DataCell(Text(e.descricao.toString())),
                                  DataCell(Text(e.responsavel.toString())),
                                  DataCell(Text(e.status.toString())),
                                ])).toList()
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