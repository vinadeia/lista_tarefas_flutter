import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'my_app.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}
