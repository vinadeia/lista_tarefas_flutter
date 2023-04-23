
import 'package:flutter/material.dart';

class AvisosAgenda extends StatelessWidget {
  const AvisosAgenda({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Avisos'),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 85,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: Color.fromRGBO(255, 216, 216, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.warning_amber,
                    color: Color.fromRGBO(150, 31, 31, 1),
                    size: 22,
                  ),
                ),
                Text('Duas atividades em atraso.')
              ],
            ),
          ),
        )
      ],
    );
  }
}