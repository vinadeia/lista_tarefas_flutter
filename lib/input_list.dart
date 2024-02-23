import 'package:app_test_flutter/components/menu_lateral.dart';
import 'package:app_test_flutter/controller_geral.dart';
import 'package:flutter/material.dart';

class InputList extends StatefulWidget {
  final ControllerGeral controllerGeral;
  const InputList({super.key, required this.controllerGeral});

  @override
  State<InputList> createState() => _InputListState();
}

class _InputListState extends State<InputList> {

  final list = <String>[];

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Atividade de listas : )")
        ),
      ),
      drawer: Drawer(
        width: 200,
        child: MenuLateral(
          controller: widget.controllerGeral,
        )
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                 Expanded(
                  child: TextField(
                    controller: controller
                    )
                ),
                IconButton(
                  onPressed: (){
                    debugPrint(list.toString());
                    final text = controller.text;
                    setState(() {
                      list.add(text);
                    });
                },
                icon: const Icon(Icons.add))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return ListTile(
                  title: Text(item),
                );
            },),
          )
        ],
      ),
    );
  }
}