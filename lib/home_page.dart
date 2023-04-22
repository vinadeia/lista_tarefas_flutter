
import 'package:app_test_flutter/components/menu_lateral.dart';
import 'package:flutter/material.dart';

//  Exemplo com controller************************

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {

//     var controller = HomeController.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       body: Center(
//         child: Text('teste ${controller.value}')
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
          
//           controller.increment();
//         }
//       ),
//     );
//   }
// }


 class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


// Controle de estado
class _HomePageState extends State<HomePage> {

  @override
  void initState() {     // Chamado quando for construído
    super.initState();
  }

  @override
  void dispose() {      // Chamado quando for destruído
    super.dispose();
  }

  var counter = 0;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Text('teste $counter')
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        }
      ),
    );
  }
}