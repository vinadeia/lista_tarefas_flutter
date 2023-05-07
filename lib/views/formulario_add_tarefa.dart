// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller_geral/controller_geral.dart';

class FormularioAddTarefa extends StatefulWidget {
  final TextEditingController prioridadeController;
  final TextEditingController tipoController;
  final TextEditingController descricaoController;
  final TextEditingController responsavelController;
  final TextEditingController statusController;
  bool? statusTeste;
  FormularioAddTarefa({
    Key? key,
    required this.prioridadeController,
    required this.tipoController,
    required this.descricaoController,
    required this.responsavelController,
    required this.statusController,
    required this.statusTeste,
  }) : super(key: key);

  @override
  State<FormularioAddTarefa> createState() => _FormularioAddTarefaState();
}

class _FormularioAddTarefaState extends State<FormularioAddTarefa> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Form(
            // key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: widget.prioridadeController,
                          decoration: const InputDecoration(
                            label: Text('Prioridade')
                          ),
                          // onFieldSubmitted: (){},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: widget.tipoController,
                          decoration: const InputDecoration(
                            label: Text('Tipo')
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: widget.descricaoController,
                    decoration: const InputDecoration(
                      label: Text('Descrição')
                    ),
                    // onFieldSubmitted: (){},
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: widget.responsavelController,
                          decoration: const InputDecoration(
                            label: Text('Responsável')
                          ),
                          // onFieldSubmitted: (){},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: widget.statusController,
                          decoration: InputDecoration(
                            prefixIcon: Checkbox(
                              value: widget.statusTeste ?? true,
                              onChanged: (val){
                                setState(() {
                                  widget.statusTeste = val;
                                });
                                print(widget.statusTeste);
                                // if (isChecked == true) {
                                //   controller.colorStatus = Colors.green;
                                // } else {
                                //   controller.colorStatus = Colors.red;
                                // }
                              }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}