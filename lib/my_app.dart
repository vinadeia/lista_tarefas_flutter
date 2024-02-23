import 'package:app_test_flutter/controller_geral.dart';
import 'package:app_test_flutter/style/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/view/login_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeApp theme = ThemeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ControllerGeral())
      ],
      child: MaterialApp(
        // home: InputList(),
        theme: theme.temaLight(),
        // darkTheme: controller.themeDark ? theme.temaDark() : theme.temaLight(),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}