// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_test_flutter/controller_geral.dart';
import 'package:flutter/material.dart';


class FormularioAddTarefa extends StatefulWidget {
  final ControllerGeral controller;
  
  const FormularioAddTarefa({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  State<FormularioAddTarefa> createState() => _FormularioAddTarefaState();
}

class _FormularioAddTarefaState extends State<FormularioAddTarefa> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Form(
            // key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: widget.controller.tituloController,
                    decoration: const InputDecoration(
                      label: Text('Titulo')
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
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = !isChecked;
                                      widget.controller.tipoController.text = 'p';
                                    });
                                  },
                                ),
                                Text('Pessoal'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = !isChecked;
                                      widget.controller.tipoController.text = 'p';
                                    });
                                  },
                                ),
                                Text('Casa'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = !isChecked;
                                      widget.controller.tipoController.text = 'p';
                                    });
                                  },
                                ),
                                Text('Extra'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: widget.controller.responsavelController,
                          decoration: const InputDecoration(
                            label: Text('Responsável')
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
                          controller: widget.controller.tempoController,
                          decoration: const InputDecoration(
                            label: Text('Tempo estimado')
                          ),
                          // onFieldSubmitted: (){},
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