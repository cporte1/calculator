import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: CalcScreen(),
    );
  }
}

class CalcScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CalcScreen> {
  String _display = '';
  String _currentNumber = '';
  String _operation = '';
  double _result = 0;

  void _numPressed(String value) {
    setState(() {
      _currentNumber += value;
      _display = _currentNumber;
    });
  }

  void _operatorPressed(String operation) {
    setState(() {
      _operation = operation;
      _result = double.parse(_currentNumber);
      _currentNumber = '';
    });
  }

  void _calculate() {
    setState(() {
      double second = double.parse(_currentNumber);

      switch(_operation) {
        case '-':
          _result -= second;
          break;
        case '+':
          _result += second;
          break;
        case '*':
          _result *= second;
          break;
        case '/':
          _result /= second;
          break;
      }

      _display = _result.toString();
      _operation = '';
      _currentNumber = '';
    });
  }

  void _clearPressed() {
    setState(() {
      _currentNumber = '';
      _operation = '';
      _result = 0;
      _display = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.bottomRight,
                child: Text(
                    _display,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _numButton('7'),
              _numButton('8'),
              _numButton('9'),
              _opButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _numButton('4'),
              _numButton('5'),
              _numButton('6'),
              _opButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _numButton('1'),
              _numButton('2'),
              _numButton('3'),
              _opButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _numButton('0'),
              _numButton('+'),
              _numButton(''),
              _opButton('C'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numButton(String value) {
    return TextButton(
        onPressed: () => _numPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 24.0),
        ),
    );
  }

  Widget _opButton(String value) {
    return TextButton(
        onPressed: (){
          if (value == 'C') {
            _clearPressed();
          } else {
            _operatorPressed(value);
          }
        },
        child: Text(
          value,
          style: TextStyle(fontSize: 24.0),
        ),
    );
  }

  Widget _buildCalculate() {
    return TextButton(
        onPressed: () => _calculate(),
        child: Text(
          '=',
          style: TextStyle(fontSize: 24.0),
        ),
    );
  }
}




