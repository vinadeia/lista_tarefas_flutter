import 'package:flutter/material.dart';

class FormularioAddTarefa extends StatelessWidget {
  final TextEditingController prioridadeController;
  final TextEditingController tipoController;
  final TextEditingController descricaoController;
  final TextEditingController responsavelController;
  final TextEditingController statusController;
  const FormularioAddTarefa({super.key, required this.prioridadeController, required this.tipoController, required this.descricaoController, required this.responsavelController, required this.statusController});

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
                      child: TextFormField(
                        controller: prioridadeController,
                        decoration: const InputDecoration(
                          label: Text('Prioridade')
                        ),
                        // onFieldSubmitted: (){},
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: tipoController,
                        decoration: const InputDecoration(
                          label: Text('Tipo')
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: descricaoController,
                  decoration: const InputDecoration(
                    label: Text('Descrição')
                  ),
                  // onFieldSubmitted: (){},
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: responsavelController,
                        decoration: const InputDecoration(
                          label: Text('Responsável')
                        ),
                        // onFieldSubmitted: (){},
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: statusController,
                        decoration: const InputDecoration(
                          label: Text('Status')
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