
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarraMetasAgenda extends StatelessWidget {
  const BarraMetasAgenda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Meta'),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 6),
          child: Container(  
            width: double.infinity,
            height: 15,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 141, 158, 230)
              ),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Stack(
              children: [
                  LayoutBuilder(
                    builder: (context, constraints) => Container(
                    // width: double.infinity,
                    width: 50,
                    decoration: BoxDecoration(
                      color:  (50 >= 60) ? Colors.greenAccent : Colors.redAccent,
                      borderRadius: BorderRadius.circular(3)
                    ),
                  ),
                ),
                // Positioned.fill(
                //   child: Center(
                //   child: Text('${e.exitoMeta.toString()}%',
                //     style: const TextStyle(
                //         fontSize: 13,
                //         height: 0.8,
                //         letterSpacing: 0.5,
                //       ),
                //     )
                //   )
                // )
              ],
            ),
          ),
        ),
        const Text('Faltam 12 tarefas para completar tua meta mensal.')
      ],
    );
  }
}