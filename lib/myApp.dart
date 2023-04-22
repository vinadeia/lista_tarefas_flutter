import 'package:app_test_flutter/input_list.dart';
import 'package:app_test_flutter/page_colum.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: InputList(),
      debugShowCheckedModeBanner: false,
      home: HomeController(
        child: const HomePage()
      )
    );
  }
}