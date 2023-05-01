import 'package:app_test_flutter/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller_geral/controller_geral.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  // final FocusNode nodeUsuario = FocusNode();
  // final FocusNode nodeSenha = FocusNode();
  // Map<String, dynamic> mapa = {};
  

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControllerGeral>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                    maxWidth: 600,
                  ),
                  child: Opacity(
                    opacity: 0.8,
                    child: Image(
                      image: const AssetImage('assets/image_login.jpg'),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                    maxWidth: 600
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only( right: 30, left: 30),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bem Vindo',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(91, 91, 91, 1),
                                    fontSize: 25
                                  )
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                                  child: TextFormField(
                                    controller: usuarioController,
                                    decoration: const InputDecoration(
                                      label: Text('Usuário')
                                    ),
                                    // onFieldSubmitted: (){},
                                  ),
                                ),
                                TextFormField(
                                  controller: senhaController,
                                  decoration: const InputDecoration(
                                    label: Text('Senha')
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20, top: 80, bottom: 100),
                        child: ElevatedButton(
                          onPressed: ()async{
                            if(formKey.currentState!.validate()){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const Dashboard()
                                )
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.check),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18
                                  )
                                ),
                              )
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}