import 'package:flutter/material.dart';
import 'package:scratch_lottery_card/reference/home_screen.dart';
import 'package:scratch_lottery_card/screen/main_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Giants-Regular',
      primaryColor: Color.fromRGBO(211, 45, 125, 1),
    ),
    home: MainScreen(),
  ));
}
