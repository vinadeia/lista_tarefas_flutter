import 'package:flutter/material.dart';

class PageListView extends StatefulWidget {
  const PageListView({super.key});

  @override
  State<PageListView> createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  @override
  Widget build(BuildContext context) {
    
    final names = ['Ana', 'Alice', 'Joaquina', 'Maria', 'Tereza', 'Lívia', 'Laura'];
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Exemplo de Listas")
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              final name = names[index];
              return ListTile(
                title: Text(name),
              );
            },
          ),
      ),
    );
  }
}