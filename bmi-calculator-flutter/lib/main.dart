import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => InputPage(),
        "/result": (context) => ResultPage(),
      },
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff202c4f),
          scaffoldBackgroundColor: Color(0xff202d4f),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
    );
  }
}
