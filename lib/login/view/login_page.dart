import 'package:app_test_flutter/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final usuario = TextEditingController();
  final senha = TextEditingController();
  FocusNode nodeUsuario = FocusNode();
  FocusNode nodeSenha = FocusNode();
  Map<String, dynamic> mapa = {};
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Opacity(
              opacity: 0.8,
              child: Image.asset('image_login.jpg',
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Usuário')
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Senha')
                          ),
                        ),
                      ],
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
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
      )
    );
  }
}