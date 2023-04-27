import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:app_test_flutter/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/model_estacao_meteorologica.dart';

class CardPrevTemp extends StatelessWidget {
  const CardPrevTemp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerGeral>();
    if(globalEstacaoModel != null){
      controller.alteraCondicaoTempo(globalEstacaoModel?.weather?[0].main);
    }
    return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now())}, ${DateTime.now().day} ${DateFormat(DateFormat.ABBR_MONTH, 'pt_Br').format(DateTime.now())} ${DateTime.now().year}',
                  style: GoogleFonts.nunito(
                    color: const Color.fromRGBO(130, 130, 130, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image(
                  image: AssetImage(controller.imageTempo),
                  height: 100,
                ),
                Center(
                  child: Text('Ensolarado',
                    style: GoogleFonts.nunito(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w800,
                    )
                  ),
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${globalEstacaoModel?.main?.tempMin}°C',
                      style: GoogleFonts.nunito(
                        color: const Color.fromRGBO(62, 62, 62, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      )
                    ),
                    Text(' | ',
                        style: GoogleFonts.nunito(
                          color: const Color.fromRGBO(121, 121, 121, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                        )
                      ),
                    Text('${globalEstacaoModel?.main?.tempMax}°C',
                      style: GoogleFonts.nunito(
                        color: const Color.fromRGBO(62, 62, 62, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      )
                    )
                  ],
                )
              ])
              // TempMaxMin(
              //   condicaoTemp: inicialController.condicaoTempo,
              //   imageTempo: inicialController.tempoCond,
              //   tempMax: widget.tempMax,
              //   tempMin: widget.tempMin
              // ),
              // ignore: unnecessary_null_comparison
              // widget.model != null ? Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Wrap(
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(right: 8),
              //               child: CircleAvatar(
              //                 backgroundColor: Color.fromRGBO(96, 194, 136, 1),
              //                 maxRadius: 15,
              //                 child: Image(
              //                   image: AssetImage('assets/images/velocidade_vento.png'),
              //                   height: 13,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 Text('${widget.ventoVelocidade}m/s',
              //                   style: inicialController.styleFontPrevDados
              //                 ),
              //                 Flexible(
              //                   child: SizedBox(
              //                     width: 55,
              //                     height: 50,
              //                     child: Text('Velocidade do Vento',
              //                       style: inicialController.styleFontPrevisao,
              //                       softWrap: true,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //         Wrap(
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(right: 8),
              //               child: CircleAvatar(
              //                 backgroundColor: Color.fromRGBO(104, 217, 255, 1),
              //                 maxRadius: 15,
              //                 child: Image(
              //                   image: AssetImage('assets/images/direcao_vento.png'),
              //                   height: 13,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 Text('${widget.ventoDirecao}km/h',
              //                   style: inicialController.styleFontPrevDados
              //                 ),
              //                 Flexible(
              //                   child: SizedBox(
              //                     width: 55,
              //                     height: 50,
              //                     child: Text('Direção do vento',
              //                       style: inicialController.styleFontPrevisao,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //         Wrap(
              //           children: [
              //                 const Padding(
              //                   padding: EdgeInsets.only(right: 8),
              //                   child: CircleAvatar(
              //                     backgroundColor: Color.fromRGBO(156, 168, 237, 1),
              //                     maxRadius: 15,
              //                     child: Image(
              //                       image: AssetImage('assets/images/precipitacao.png'),
              //                       height: 13,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('${widget.chuva}%',
              //                   style: inicialController.styleFontPrevDados
              //                 ),
              //                 Text('Precipitação ',
              //                   style: inicialController.styleFontPrevisao,
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     )
              //   ],
              // ) : const CircularProgressIndicator(
              //   strokeWidth: 3.0,
              // )
            ],
          ),
        );
  }
}