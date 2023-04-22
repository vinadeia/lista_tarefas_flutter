import 'package:app_test_flutter/components/menu_lateral.dart';
import 'package:flutter/material.dart';

class InputList extends StatefulWidget {
  const InputList({super.key});

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
      drawer: const Drawer(
        width: 200,
        child: MenuLateral()
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
                    print(list);
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