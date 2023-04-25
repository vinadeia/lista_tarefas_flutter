import 'package:app_test_flutter/controller_geral/controller_geral.dart';
import 'package:app_test_flutter/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/view/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ControllerGeral())
      ],
      child: MaterialApp(
        // home: InputList(),
        theme: temaLight(),
        darkTheme: temaDark(),
        debugShowCheckedModeBanner: false,
        // home: const Dashboard(),
        home: const LoginPage(),
      ),
    );
  }

  ThemeData temaDark() => ThemeData.dark();

  ThemeData temaLight() => ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(

      primary: const Color(0xff48CFAD),
      background: const Color(0xffF5F7FA),

      // or from RGB

      // primary: const Color(0xFF343A40),
      // secondary: const Color(0xFFFFC107),

    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff48CFAD),
      width: 200,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.white,
    ),
    cardTheme:const CardTheme(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      color: Color.fromARGB(255, 255, 255, 255),
      shadowColor: Color.fromRGBO(51, 51, 51, 0.5),
      elevation: 30.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0)
        ),
        side: BorderSide(
          width: 1,
          color: Color.fromARGB(255, 191, 202, 202)
        ),
      ),
    ),
  );
}