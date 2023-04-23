// import 'dart:ffi';
import 'package:flutter/material.dart';

class PageColumn extends StatefulWidget {
  const PageColumn({super.key});

  @override
  State<PageColumn> createState() => _PageColumnState();
}

class _PageColumnState extends State<PageColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Exemplo Colunas")
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                color: Colors.red
              ),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.all(10),
                color: Colors.green
              ),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.all(10),
                color: Colors.yellow
              ),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.all(10),
                color: Colors.lightBlue
              ),
              Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.all(10),
                color: Colors.orange
              )
            ],
          ),
        ),
      ),
    );
  }
}