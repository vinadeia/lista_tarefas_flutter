import 'package:app_test_flutter/controller_geral.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/model_estacao_meteorologica.dart';

class CardPrevTemp extends StatefulWidget {
  const CardPrevTemp({super.key});

  @override
  State<CardPrevTemp> createState() => _CardPrevTempState();
}

class _CardPrevTempState extends State<CardPrevTemp> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerGeral>();
    // if(globalEstacaoModel != null){
    //   controller.alteraCondicaoTempo(globalEstacaoModel?.weather?[0].main);
    // }
    return
      Container(
          color: Colors.white,
          child: 
          globalEstacaoModel == null ?
          Text('Previsão do tempo indisponível') :
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${globalEstacaoModel?.name}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(91, 91, 91, 1),
                        fontSize: 16
                      )
                    ),
                    Text(
                      '${DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now())}, ${DateTime.now().day} ${DateFormat(DateFormat.ABBR_MONTH, 'pt_Br').format(DateTime.now())} ${DateTime.now().year}',
                      style: GoogleFonts.nunito(
                        color: const Color.fromRGBO(130, 130, 130, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                          image: AssetImage(controller.imageTempo),
                          height: 90,
                        ),
                        Text('${globalEstacaoModel?.weather?[0].description}',
                          style: GoogleFonts.nunito(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w800,
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Image(
                              image: AssetImage('assets/termometro.png'),
                              height: 15,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${globalEstacaoModel?.main?.feelsLike?.toStringAsFixed(0)}°C',
                                style: GoogleFonts.nunito(
                                  color: const Color.fromRGBO(62, 62, 62, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                )
                              ),
                              Text('Sensação térmica',
                                style: GoogleFonts.nunito(
                                  color: const Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Image(
                                image: AssetImage('assets/umidade.png'),
                                height: 15,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${globalEstacaoModel?.main?.humidity?.toStringAsFixed(0)}',
                                  style: GoogleFonts.nunito(
                                    color: const Color.fromRGBO(62, 62, 62, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  )
                                ),
                                Text('Umidade',
                                  style: GoogleFonts.nunito(
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10
                                  )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Image(
                                  image: AssetImage('assets/pressao.png'),
                                  height: 20,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${globalEstacaoModel?.main?.pressure?.toStringAsFixed(0)}',
                                    style: GoogleFonts.nunito(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15
                                    )
                                  ),
                                  Text('Pressão',
                                    style: GoogleFonts.nunito(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10
                                    )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('${globalEstacaoModel?.main?.tempMin?.toStringAsFixed(0)}°C',
                            style: GoogleFonts.nunito(
                              color: const Color.fromRGBO(62, 62, 62, 1),
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            )
                          ),
                          Text('Temp. mínima',
                            style: GoogleFonts.nunito(
                              color: const Color.fromRGBO(62, 62, 62, 1),
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            )
                          ),
                        ],
                      ),
                      Text(' | ',
                          style: GoogleFonts.nunito(
                            color: const Color.fromRGBO(121, 121, 121, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                          )
                        ),
                      Column(
                        children: [
                          Text('${globalEstacaoModel?.main?.tempMax?.toStringAsFixed(0)}°C',
                            style: GoogleFonts.nunito(
                              color: const Color.fromRGBO(62, 62, 62, 1),
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            )
                          ),
                          Text('Temp. máxima',
                            style: GoogleFonts.nunito(
                              color: const Color.fromRGBO(62, 62, 62, 1),
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            )
                          ),
                        ],
                      ),
                    ],
                  )
                ]
                ),
              )
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