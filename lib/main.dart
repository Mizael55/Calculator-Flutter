import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(18.0),
          child: SizedBox(
            width: double.infinity,
            child: CalcButton(),
          ),
        ),
      ),
    );
  }
}

class CalcButton extends StatefulWidget {
  const CalcButton({Key? key}) : super(key: key);

  @override
  CalcButtonState createState() => CalcButtonState();
}

class CalcButtonState extends State<CalcButton> {
  double? _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    var calc = SimpleCalculator(
      value: _currentValue!,
      hideExpression: false,
      hideSurroundingBorder: true,
      autofocus: true,
      onChanged: (key, value, expression) {
        setState(() {
          _currentValue = value ?? 0;
        });
        if (kDebugMode) {
          print('$key\t$value\t$expression');
        }
      },
      onTappedDisplay: (value, details) {
        if (kDebugMode) {
          print('$value\t${details.globalPosition}');
        }
      },
      theme: const CalculatorThemeData(
        borderColor: Colors.black,
        borderWidth: 2,
        displayColor: Colors.grey,
        displayStyle: TextStyle(fontSize: 80, color: Colors.black),
        expressionColor: Colors.grey,
        expressionStyle: TextStyle(fontSize: 20, color: Colors.black),
        operatorColor: Colors.black,
        operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Colors.black,
        commandStyle: TextStyle(fontSize: 30, color: Colors.white),
        numColor: Colors.black,
        numStyle: TextStyle(fontSize: 50, color: Colors.white),
      ),
    );
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
      child: calc);
  }
}
