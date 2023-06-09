import 'package:app_test_flutter/agenda/view/agenda.dart';
import 'package:app_test_flutter/views/lista_tarefas.dart';
import 'package:app_test_flutter/views/graficos.dart';
import 'package:app_test_flutter/views/dashboard.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          // const DrawerHeader(
          //   child: Center(
          //     child: Text('Menu Lateral'),
          //   ),
          // ),
          ListTile(
            leading: Builder(builder: (context) {
              return Transform.translate(
                offset: const Offset(-10.0, 0.0),
                child: IconButton(
                  icon: const Icon(Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () => Scaffold.of(context).closeDrawer(),
                ),
              );
            }),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Dashboard'),
            onTap: () =>  
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              )
            )
          ),
          ListTile(
            leading: const Icon(
              Icons.adb,
              color: Colors.green,
            ),
            title: const Text('Lista de Tarefas'),
            onTap: () =>  
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListaTarefas(),
              )
            )
          ),
          ListTile(
            leading: const Icon(Icons.yard_outlined),
            title: const Text('Gráficos'),
            onTap: () =>  
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Graficos(),
              )
            )
          ),
          ListTile(
            leading: const Icon(
              Icons.woo_commerce,
              color: Colors.orange,  
            ),
            title: const Text('Agenda'),
            onTap: () =>  
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Agenda(),
              )
            )
          ),
        ],
      ),
    );
  }
}