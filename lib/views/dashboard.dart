import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/menu_lateral.dart';
import '../components/model_tarefa.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final model = ListaTarefas();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            )
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
                                onPressed: (){},
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
                      child: GridView.count(
                        crossAxisCount: 7,
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(label: Text('Prioridade')),
                              DataColumn(label: Text('Nome')),
                              DataColumn(label: Text('Descrição')),
                              DataColumn(label: Text('Responsável')),
                              DataColumn(label: Text('Status')),
                            ],
                            rows: model.listaTarefas.map((e) => 
                              DataRow(cells: <DataCell>[
                                DataCell(Text(e.prioridade.toString())),
                                DataCell(Text(e.nome.toString())),
                                DataCell(Text(e.descricao.toString())),
                                DataCell(Text(e.responsavel.toString())),
                                DataCell(Text(e.status.toString())),
                              ])).toList()
                          )
                        ],
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